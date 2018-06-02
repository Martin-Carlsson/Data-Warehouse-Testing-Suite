CREATE TABLE [DWTest].[Result]
(
	[Id] INT IDENTITY NOT NULL PRIMARY KEY, 
    [ExecutionPathId] INT NOT NULL, 
    [StartTime] DATETIME2 NOT NULL, 
    [EndTime] DATETIME2 NOT NULL, 
    [ResultTypeId] INT NOT NULL,
    [Description] NVARCHAR(MAX) NOT NULL, 
    [Batch] DATETIME2 NOT NULL, 
    CONSTRAINT [FK_Result_ExecutionPath] FOREIGN KEY ([ExecutionPathId]) REFERENCES [DWTest].[ExecutionPath]([Id]), 
    CONSTRAINT [FK_Result_ResultType] FOREIGN KEY ([ResultTypeId]) REFERENCES [DWTest].[ResultType]([Id])
)
