CREATE FUNCTION [DWTest].[GetResultTypeId]
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
		[DWTest].[ResultType]
	WHERE
		[Name] = @Name;

	RETURN @Id
END
