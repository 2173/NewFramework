@echo off

set clientUrl="https://n6bdo6uf3kz4zy4/svn/FirClient"
set clientPath="E:\workspace\ProjectOne\FirClient"
set dataUrl="https://n6bdo6uf3kz4zy4/svn/DataTable"
set editorUrl="https://n6bdo6uf3kz4zy4/svn/ClientEditor"
set serverUrl="https://n6bdo6uf3kz4zy4/svn/FirServer"
set toolPath="E:\workspace\ProjectOne\Tools\Bin"


set user="admin"
set passwd="admin888"

::���´��빤��
cd %clientPath%
if exist %clientPath%\Assets (
	svn up %clientPath% --username %user% --password %passwd% --force
) else (
	svn checkout %clientUrl%FirClient %clientPath% --username %user% --password %passwd% --force
)

::�༭����Դ�ϲ������빤��
rd/s /q %clientPath%\Assets\res
svn export %editorUrl%/Assets/res %clientPath%/Assets/res --username %user% --password %passwd% --force

::���±༭���������湫�õĴ���
rd/s /q %clientPath%\Assets\Scripts\Common
svn export %editorUrl%/Assets/Scripts/Common %clientPath%/Assets/Scripts/Common --username %user% --password %passwd% --force


::���±༭����������VIEW�Ĵ���
rd/s /q %clientPath%\Assets\Scripts\UI\View
svn export %editorUrl%/Assets/Scripts/View %clientPath%/Assets/Scripts/UI/View --username %user% --password %passwd% --force

::���±༭����������������ļ�
rd/s /q %clientPath%\ProjectSettings\TagManager.asset
svn export %editorUrl%/ProjectSettings/TagManager.asset %clientPath%/ProjectSettings/TagManager.asset --username %user% --password %passwd% --force

rd/s /q %clientPath%\ProjectSettings\QualitySettings.asset
svn export %editorUrl%/ProjectSettings/QualitySettings.asset %clientPath%/ProjectSettings/QualitySettings.asset --username %user% --password %passwd% --force

::����EXCEL���ñ�
rd/s /q %clientPath%\Assets\DataTable
svn export %dataUrl% %clientPath%\Assets\DataTable --username %user% --password %passwd% --force

::�������ݱ�
rd/s /q %clientPath%\Assets\Scripts\Tables\*.*
%toolPath%\TableTool.exe %toolPath% %clientPath%\Assets\DataTable %clientPath%\Assets\Scripts\Tables\ 

echo "�������!"
pause  