{*******************************************************************************
   Unit
      uConsts.pas
   Description:
      Common constants for sEditTools
   Versions:
   History:
   Autor(s):
      Dimitry Statilko - dstatus@iname.com, dima@mobitel.com**
   Comments:
*******************************************************************************}
unit BfConsts;

interface

uses Messages;

resourcestring
   RegistryDelphiPath = 'Software\borland\Delphi\';

   RegEntryFormState = 'FormState';
   RegEntryFormLeft = 'FormLeft';
   RegEntryFormTop = 'FormTop';
   RegEntryFormWidth = 'FormWidth';
   RegEntryFormHeight = 'FormHeight';

   EmptyStr = '';


resourcestring
{sBrowseFolder}
   STestMessage = 'Item Selecionado:'#13#13'%s';

{sEdits}
   SNoDateCaption = 'Sem Dados';
   SBrowseCaption = 'Pesquisa';
   SDefaultFilesFilter = 'Todos os Arquivos (*.*)|*.*';
{sPickDate}
   STodayCaption = 'Hoje';

{sGlyphList}
   SChangeGlyphIdTitles = 'Editar glyph Id';
   SChangeGlyphIdCaption = 'Favor entrar com o glyph id aqui:';
   SGlyphListEditorRegistryEntry = 'GlyphsListForm';

{stdUtils}
   SDefaultLogFilename = 'noname.log';
   SDefaultErrorMessage = 'Error:' + #10 + #13 +  '%s';
   SSaveChangesQuery = 'Salva Alterações ?';

{ Error messages}
   SErrorNeedsBmp = 'Não é possível especificar um glyph que não seja um bitmap';
   SErrorGlyphNotFound = 'Glyph com o Id %d não foi encontrado na lista';
   SErrorDuplicateId = 'Glyph com o Id %s já existe na lista';
   SErrorInvalidGlyphId = 'Glyph Id tem que ser um número positivo';
   SErrorResourceNotFound = 'Resource %s não encontrado';
   SErrorInvalidUpDownGlyph = 'UpDown control para o glyph inválido';
   SErrorNoFileInformation = 'Sem informação de arquivo';

{Registration}
   SEditToolsPageCaption = 'sEditTools';
   SDBEditToolsPageCaption = 'sDBEditTools';
{editors}
   SGlyphEditorCaption = 'Glyphs Editor';
   STestDialogEditorCaption = 'Teste Dialog';
   STransRefreshEditor = 'Refresh';

{ *******************************
   MESSAGES used by sEditTools.
********************************}

const
   STM_FIRST = WM_USER + 100;
   STM_GLYPHIDCHANGED      = STM_FIRST + 1;
   STM_ENABLEDCHANGENOTIFY = STM_FIRST + 2;
   STM_MOUSEENTERNOTIFY    = STM_FIRST + 3;
   STM_MOUSELEAVENOTIFY    = STM_FIRST + 4;

implementation





end.
