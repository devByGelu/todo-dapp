const Todo = artifacts.require("Todo");

contract("Add Todo test", (accounts) => {
  it("Add 2 todos in the first account", async () => {
    const instance = await Todo.deployed();
    await instance.addTodo("todo 0");
    const newLength = (await instance.addTodo.call("todo 1")).toNumber(10);
    assert.equal(2, newLength);
  });
});

contract("Delete Todo test", (accounts) => {
  it("Delete one todo in the first account", async () => {
    const instance = await Todo.deployed();
    await instance.addTodo("todo 0");
    const newLength = (await instance.remove.call(0)).toNumber();
    assert.equal(0, newLength);
  });
});
