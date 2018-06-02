CREATE TABLE [DWTest].[ExecutionPath]
(
	[Id] INT IDENTITY NOT NULL PRIMARY KEY, 
    [Name] NVARCHAR(500) NOT NULL UNIQUE, 
    [Description] NVARCHAR(MAX) NULL, 
    [TestingScriptName] NVARCHAR(50) NOT NULL, 
    [Parameters] NVARCHAR(MAX) NULL, 
    [IsActive] NCHAR(10) NOT NULL, 
    CONSTRAINT [CK_ExecutionPath_IsActive] CHECK ([IsActive] IN ('Yes', 'No'))
)
