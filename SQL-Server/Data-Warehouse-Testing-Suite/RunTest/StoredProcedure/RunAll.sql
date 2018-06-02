CREATE PROCEDURE [DWTest].[RunAll]
AS
	DECLARE @Name NVARCHAR(500);
	DECLARE @TestingScriptName NVARCHAR(50);
	DECLARE @Procedure NVARCHAR(MAX);
	DECLARE @Batch DATETIME2 = SYSDATETIME();

	SELECT
		[Name],
		[TestingScriptName]
	INTO
		#ExecutionPath
	FROM
		[DWTest].[ExecutionPath]
	WHERE
		[IsActive] = 'Yes';

	WHILE EXISTS (SELECT [Name] FROM #ExecutionPath)
	BEGIN
		SELECT TOP 1
			@Name = [Name],
			@TestingScriptName = [TestingScriptName]
		FROM
			#ExecutionPath;
		
		SET @Procedure = '[DWTest].[' + @TestingScriptName + '] ' + @Name + ', ''' + CONVERT(NVARCHAR, @Batch) + '''';

		EXEC sp_executesql @Procedure;

		DELETE 
			#ExecutionPath
		WHERE 
			[Name] = @Name;
	END
	DROP TABLE #ExecutionPath;
RETURN 0