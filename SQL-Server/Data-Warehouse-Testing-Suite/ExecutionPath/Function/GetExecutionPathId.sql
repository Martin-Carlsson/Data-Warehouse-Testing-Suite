CREATE FUNCTION [DWTest].[GetExecutionPathId]
(
	@Name NVARCHAR(MAX)
)
RETURNS INT
AS
BEGIN
	DECLARE @Id Int;

	SELECT
		@Id = Id
	FROM
		[DWTest].[ExecutionPath]
	WHERE
		[Name] = @Name;

	RETURN @Id
END
