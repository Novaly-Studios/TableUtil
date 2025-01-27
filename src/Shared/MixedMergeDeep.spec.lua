return function()
    local MixedMergeDeep = require(script.Parent.Parent).Map.MixedMergeDeep

    describe("Shared/MixedMergeDeep", function()
        it("should return the same table for two equivalent merged tables", function()
            local Test = {}
            local Result = MixedMergeDeep(Test, Test)
            expect(Result).to.be.a("table")
            expect(Result).to.equal(Test)
        end)

        it("should merge some flat values in and return a new table", function()
            local X = {
                A = 1;
                B = 2;
            }
            local Y = {
                C = 3;
                D = 4;
            }

            local Result = MixedMergeDeep(X, Y)
            expect(Result).to.be.a("table")
            expect(Result.A).to.equal(1)
            expect(Result.B).to.equal(2)
            expect(Result.C).to.equal(3)
            expect(Result.D).to.equal(4)
            expect(X).never.to.equal(Result)
            expect(Y).never.to.equal(Result)
        end)

        it("should merge two nested values together and return create new tables for modified levels", function()
            local X = {
                P = 1;
                Q = {
                    R = 2;
                };
            }
            local Y = {
                Q = {
                    S = 3;
                };
            }

            local Result = MixedMergeDeep(X, Y)
            expect(Result).to.be.a("table")
            expect(Result.P).to.equal(1)
            expect(Result.Q).to.be.a("table")
            expect(Result.Q.R).to.equal(2)
            expect(Result.Q.S).to.equal(3)
            expect(Result.Q).never.to.equal(X.Q)
            expect(Result.Q).never.to.equal(Y.Q)

            local Reverse = MixedMergeDeep(Y, X)
            expect(Reverse).to.be.a("table")
            expect(Reverse.P).to.equal(1)
            expect(Reverse.Q).to.be.a("table")
            expect(Reverse.Q.R).to.equal(2)
            expect(Reverse.Q.S).to.equal(3)
            expect(Reverse.Q).never.to.equal(X.Q)
            expect(Reverse.Q).never.to.equal(Y.Q)
        end)

        it("should keep unmodified sub-tables untouched", function()
            local X = {
                A = {};
                B = {
                    Test = true;
                };
            }
            local Y = {
                B = {
                    C = {};
                };
            }

            local Result = MixedMergeDeep(X, Y)
            expect(Result).to.be.a("table")
            expect(Result.A).to.equal(X.A)
            expect(Result.B).to.be.a("table")
            expect(Result.B.Test).to.equal(true)
            expect(Result.B.C).to.be.a("table")
            expect(Result.B).never.to.equal(X.B)
            expect(Result.B).never.to.equal(Y.B)
            expect(Result.B.C).to.equal(Y.B.C)
        end)

        it("should return the original table when both tables are the same", function()
            local X = {P = true, Q = true, R = true}
            local Y = X

            local Result = MixedMergeDeep(X, Y)
            expect(Result).to.equal(X)
            expect(Result).to.equal(Y)
        end)

        it("should preserve left-side metatables when the right-side has no metatable", function()
            local MT = {__gt = function() return false end}

            -- With values inside.
            local Result = MixedMergeDeep({
                Test = {
                    Test = setmetatable({Value1 = 1}, MT);
                };
            }, {
                Test = {
                    Test = {Value2 = 2};
                };
            })
            expect(getmetatable(Result.Test.Test)).to.equal(MT)

            -- With no values inside.
            Result = MixedMergeDeep({
                Test = {
                    Test = setmetatable({}, MT);
                };
            }, {
                Test = {
                    Test = {};
                };
            })
            expect(getmetatable(Result.Test.Test)).to.equal(MT)
        end)

        it("should overwrite left-side metatables with right-side metatables", function()
            local MT = {__gt = function() return false end}
            local MT2 = {__gt = function() return false end}

            -- With values inside.
            local Result = MixedMergeDeep({
                Test = {
                    Test = setmetatable({Value1 = 1}, MT);
                };
            }, {
                Test = {
                    Test = setmetatable({Value2 = 2}, MT2);
                };
            })
            expect(getmetatable(Result.Test.Test)).to.equal(MT2)

            -- With no values inside.
            local X = {
                Test = {
                    Test = setmetatable({}, MT);
                };
            }
            local Y = {
                Test = {
                    Test = setmetatable({}, MT2);
                };
            }
            Result = MixedMergeDeep(X, Y)
            expect(getmetatable(Result.Test.Test)).to.equal(MT2)
            expect(Result.Test.Test).never.to.equal(X.Test)
            expect(Result.Test.Test).never.to.equal(Y.Test)
        end)

        it("should preserve right-side metatables when a new value is added", function()
            local MT = {__gt = function() return false end}

            -- With values inside.
            local Result = MixedMergeDeep({Value1 = 1}, {
                Test = {
                    Test = setmetatable({Value2 = 2}, MT);
                };
            })
            expect(getmetatable(Result.Test.Test)).to.equal(MT)

            -- With no values inside.
            Result = MixedMergeDeep({}, {
                Test = {
                    Test = setmetatable({}, MT);
                };
            })
            expect(getmetatable(Result.Test.Test)).to.equal(MT)
        end)

        it("should pass the left-side value for mapping into a right-side function when functional mappers is enabled", function()
            local Test1 = MixedMergeDeep({
                Inner = {
                    X = 1;
                    Y = 2;
                };
            }, {
                Inner = {
                    Y = function(Value)
                        return 1000 + Value
                    end;
                };
            })

            expect(Test1.Inner.X).to.equal(1)
            expect(Test1.Inner.Y).to.be.a("function")

            local Test2 = MixedMergeDeep({
                Inner = {
                    X = 1;
                    Y = 2;
                };
            }, {
                Inner = {
                    Y = function(Value)
                        return 1000 + Value
                    end;
                };
            }, true)

            expect(Test2.Inner.X).to.equal(1)
            expect(Test2.Inner.Y).to.equal(1002)
        end)

        it("should propagate the change up the structure but keep unchanged nodes equal", function()
            local Base = {X = {Y = {Value = 1}, Z = {Value = 22}}}
            local Result = MixedMergeDeep(Base, {X = {Y = {Value = 2}, Z = {Value = 22}}})
            expect(Result).never.to.equal(Base)
            expect(Base.X.Z).to.equal(Result.X.Z)
        end)

        it("should produce unequal tables if the right-side metatable is different", function()
            local Base = {}
            local Result = MixedMergeDeep(Base, setmetatable({}, {}))
            expect(Result).never.to.equal(Base)
        end)

        it("should result in equal tables given equal values, under right side no metatable and left side has metatable condition", function()
            local Base = {Test = setmetatable({}, {})}
            local Result = MixedMergeDeep(Base, {Test = {}})
            expect(Result).to.equal(Base)
        end)

        it("should correctly substitute in nil values with mapper functions", function()
            expect(MixedMergeDeep({X = {Y = 1}}, {X = {Y = function(Value)
                return nil
            end}}, true).X.Y).to.equal(nil)
        end)

        it("should overwrite primitive values with a table", function()
            local Result = MixedMergeDeep({X = false, Y = 123}, {X = {Value = 1}, Y = {Value = 2}})
            expect(Result.X).to.be.a("table")
            expect(Result.X.Value).to.equal(1)
            expect(Result.Y).to.be.a("table")
            expect(Result.Y.Value).to.equal(2)
        end)

        it("should merge arrays together", function()
            local X = {1, 2, 3}
            local Y = {4, 5, 6}

            local Result = MixedMergeDeep(X, Y)
            expect(Result).to.be.a("table")
            expect(Result).to.never.equal(X)
            expect(Result).to.never.equal(Y)

            for Count = 1, 6 do
                expect(Result[Count]).to.equal(Count)
            end
        end)

        it("should merge multiple mixed tables together", function()
            local X = {1, 2, 3, X = 123}
            local Y = {4, 5, 6, Y = 456}

            local Result = MixedMergeDeep(X, Y)
            expect(Result).to.be.a("table")
            expect(Result).to.never.equal(X)
            expect(Result).to.never.equal(Y)

            for Count = 1, 6 do
                expect(Result[Count]).to.equal(Count)
            end

            expect(Result.X).to.equal(123)
            expect(Result.Y).to.equal(456)
        end)

        it("should merge multiple arrays recursively", function()
            local Result = MixedMergeDeep({
                1, 2, Inner = {5}
            }, {
                3, 4, Inner = {6}
            })

            expect(Result).to.be.a("table")
            expect(Result.Inner).to.be.a("table")

            for Count = 1, 4 do
                expect(Result[Count]).to.equal(Count)
            end

            expect(Result.Inner[1]).to.equal(5)
            expect(Result.Inner[2]).to.equal(6)
        end)
    end)
end