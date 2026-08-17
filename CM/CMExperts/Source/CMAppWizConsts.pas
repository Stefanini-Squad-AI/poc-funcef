unit CMAppWizConsts;

interface

type
  TFileExtension = (feModulo, fePrincipalPas, fePrincipalDfm, feDof);
const
  FileDpr = 'program %DPRNAME%;' + #13#10 +
            '' + #13#10 +
            'uses' + #13#10 +
            '  Forms,' + #13#10 +
            '  uAutorizacao,' + #13#10 +
            '  fCMEntrada,' + #13#10 +
            '  FPai in ''..\..\CM\Forms\Source\FPai.pas'' {frmPai},' + #13#10 +
            '  FTelaAut in ''..\..\CM\Forms\Source\FTelaAut.pas'' {frmTelaAutorizacao},' + #13#10 +
            '  fAguarde in ''..\..\CM\Forms\Source\fAguarde.pas'' {frmAguarde},' + #13#10 +
            '  FCMPrincipal in ''..\..\CM\Forms\Source\FCMPrincipal.pas'' {frmCMPrincipal},' + #13#10 +
            '  FPrincipal in ''FPrincipal.pas'' {frmPrincipal},' + #13#10 +
            '  FSairAjuda in ''..\..\CM\Forms\Source\FSairAjuda.pas'' {frmSairAjuda},' + #13#10 +
            '  FOkCancelar in ''..\..\CM\Forms\Source\FOkCancelar.pas'' {frmOkCancelar},' + #13#10 +
            '  FCadastroCS in ''..\..\CM\Forms\Source\FCadastroCS.pas'' {frmCadastroCS},' + #13#10 +
            '  UModulo%DPRNAME% in ''UModulo%DPRNAME%.pas'';' + #13#10 +
            '' + #13#10 +
            '{$R *.RES}' + #13#10 +
            '' + #13#10 +
            'begin' + #13#10 +
            '  frmCMEntrada:= TfrmCMEntrada.Create(Application);' + #13#10 +
            '  frmCMEntrada.Show;' + #13#10 +
            '  frmCMEntrada.Update;' + #13#10 +
            '' + #13#10 +
            '  Application.Initialize;' + #13#10 +
            '  Application.Title := ''%TITULO%'';' + #13#10 +
            '  Application.CreateForm(TfrmPrincipal, frmPrincipal);' + #13#10 +
            '  Application.CreateForm(TfrmAguarde, frmAguarde);' + #13#10 +
            '  frmCMEntrada.Hide;' + #13#10 +
            '  frmCMEntrada.Free;' + #13#10 +
            '  Application.Run;' + #13#10 +
            '' + #13#10 +
            'end.';

  FileUModulo = 'unit UModulo%DPRNAME%;' + #13#10 +
                '' + #13#10 +
                'interface' + #13#10 +
                '' + #13#10 +
                'type TModulo%DPRNAME% = Class' + #13#10 +
                '   private' + #13#10 +
                '     FExemplo : string;' + #13#10 +
                '   public' + #13#10 +
                '     property Exemplo : string read FExemplo write FExemplo;' + #13#10 +
                '   end;' + #13#10 +
                '' + #13#10 +
                'var Modulo%DPRNAME% : TModulo%DPRNAME%;' + #13#10 +
                '' + #13#10 +
                'implementation' + #13#10 +
                '' + #13#10 +
                'end.';

  FilePrincipalPas = 'unit FPrincipal;' + #13#10 +
                     '' + #13#10 +
                     'interface' + #13#10 +
                     '' + #13#10 +
                     'uses' + #13#10 +
                     '  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,' + #13#10 +
                     '  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,' + #13#10 +
                     '  fTelaAut, uAutorizacao, uSistema, TB97, Db, Wwdatsrc, DBTables, Wwquery,' + #13#10 +
                     '  wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls, uModulo, TB97Tlwn, TB97Tlbr,' + #13#10 +
                     '  TB97Ctls, ImgList, CorreioCM, IvDictio, IvAMulti, IvBinDic, IvMulti,' + #13#10 +
                     '  IvEMulti, fcLabel;' + #13#10 +
                     '' + #13#10 +
                     'type' + #13#10 +
                     '  TfrmPrincipal = class(TfrmCMPrincipal)' + #13#10 +
                     '  private' + #13#10 +
                     '  public' + #13#10 +
                     '  end;' + #13#10 +
                     '' + #13#10 +
                     'var' + #13#10 +
                     '  frmPrincipal: TfrmPrincipal;' + #13#10 +
                     '' + #13#10 +
                     'implementation' + #13#10 +
                     '{$R *.DFM}' + #13#10 +
                     '' + #13#10 +
                     'initialization' + #13#10 +
                     '   Sistema.NomeModulo := ''%NOMEMODULO%''; // Nome do Módulo' + #13#10 +
                     '   Sistema.IdModulo := %IDMODULO%;         // IdModulo cadastrado no SAD' + #13#10 +
                     '   Sistema.Versao := ''03.00.00'';    // Versão sendo compilada' + #13#10 +
                     '   Sistema.NomeAplicativo := ''%TITULO%'';' + #13#10 +
                     '   Modulo := TModulo.Create  ;' + #13#10 +
                     '' + #13#10 +
                     'finalization' + #13#10 +
                     '   Modulo.free;' + #13#10 +
                     '' + #13#10 +
                     '' + #13#10 +
                     'end.';

  FilePrincipalDfm = 'inherited frmPrincipal: TfrmPrincipal' + #13#10 +
                     '  Left = 323' + #13#10 +
                     '  Top = 174' + #13#10 +
                     '  Caption = ''%TITULO%''' + #13#10 +
                     '  PixelsPerInch = 96' + #13#10 +
                     '  TextHeight = 13' + #13#10 +
                     '  inherited IvDicionario: TIvBinaryDictionary' + #13#10 +
                     '    DictionaryCode = 4' + #13#10 +
                     '  end' + #13#10 +
                     'end';
  FileRes = '';


  FileDof = '[Compiler]' + #13#10 +
            'A=1' + #13#10 +
            'B=0' + #13#10 +
            'C=1' + #13#10 +
            'D=1' + #13#10 +
            'E=0' + #13#10 +
            'F=0' + #13#10 +
            'G=1' + #13#10 +
            'H=1' + #13#10 +
            'I=1' + #13#10 +
            'J=1' + #13#10 +
            'K=0' + #13#10 +
            'L=1' + #13#10 +
            'M=0' + #13#10 +
            'N=1' + #13#10 +
            'O=1' + #13#10 +
            'P=1' + #13#10 +
            'Q=0' + #13#10 +
            'R=0' + #13#10 +
            'S=0' + #13#10 +
            'T=0' + #13#10 +
            'U=0' + #13#10 +
            'V=1' + #13#10 +
            'W=0' + #13#10 +
            'X=1' + #13#10 +
            'Y=0' + #13#10 +
            'Z=1' + #13#10 +
            'ShowHints=1' + #13#10 +
            'ShowWarnings=1' + #13#10 +
            'UnitAliases=WinTypes=Windows;WinProcs=Windows;DbiTypes=BDE;DbiProcs=BDE;DbiErrs=BDE;' + #13#10 +
            '[Linker]' + #13#10 +
            'MapFile=0' + #13#10 +
            'OutputObjs=0' + #13#10 +
            'ConsoleApp=1' + #13#10 +
            'DebugInfo=0' + #13#10 +
            'RemoteSymbols=0' + #13#10 +
            'MinStackSize=16384' + #13#10 +
            'MaxStackSize=1048576' + #13#10 +
            'ImageBase=4194304' + #13#10 +
            'ExeDescription=' + #13#10 +
            '[Directories]' + #13#10 +
            'OutputDir=c:\ProjetosCM5\Bin' + #13#10 +
            'UnitOutputDir=..\dcu' + #13#10 +
            'PackageDLLOutputDir=' + #13#10 +
            'PackageDCPOutputDir=' + #13#10 +
            'SearchPath=c:\ProjetosCM5\CM\Packages' + #13#10 +
            'Packages=Vcl50;Vclx50;VclSmp50;Vcldb50;vclado50;ibevnt50;Vclbde50;vcldbx50;Qrpt50;TeeUI50;TeeDB50;Tee50;Dss50;' +
                     'TeeQR50;VCLIB50;Vclmid50;vclie50;Inetdb50;Inet50;NMFast50;webmid50;dclocx50;dclaxserver50;TB97_d5;' +
                     'CMAdd50;Ml42ND50;Ml42DB50;rbTDBC51;rbRCL55;rbCIDE55;rbIDE55;rbBDE55;rbRIDE55;rbRAP55;rbDBDE55;rbDAD55;rbDIDE55;' +
                     'rbUSER55;xtradev;ip50client_d5;ip50_d5;ip50word_d5;FirstClass2000_vcl5;Indy50;CmCompo50;CmOld50;CmBussines50;CMRegra50;CMTotalPrev50;CmForms50;CmBack50;CmIntBanco50' + #13#10 +
            'Conditionals=' + #13#10 +
            'DebugSourceDirs=' + #13#10 +
            'UsePackages=1' + #13#10 +
            '[Parameters]' + #13#10 +
            'RunParams=' + #13#10 +
            'HostApplication=' + #13#10 +
            '[Language]' + #13#10 +
            'ActiveLang=' + #13#10 +
            'ProjectLang=$00000416' + #13#10 +
            'RootDir=' + #13#10 +
            '[Version Info]' + #13#10 +
            'IncludeVerInfo=1' + #13#10 +
            'AutoIncBuild=0' + #13#10 +
            'MajorVer=1' + #13#10 +
            'MinorVer=0' + #13#10 +
            'Release=0' + #13#10 +
            'Build=0' + #13#10 +
            'Debug=0' + #13#10 +
            'PreRelease=0' + #13#10 +
            'Special=0' + #13#10 +
            'Private=0' + #13#10 +
            'DLL=0' + #13#10 +
            'Locale=1046' + #13#10 +
            'CodePage=1252' + #13#10 +
            '[Version Info Keys]' + #13#10 +
            'CompanyName=' + #13#10 +
            'FileDescription=' + #13#10 +
            'FileVersion=1.0.0.0' + #13#10 +
            'InternalName=' + #13#10 +
            'LegalCopyright=' + #13#10 +
            'LegalTrademarks=' + #13#10 +
            'OriginalFilename=' + #13#10 +
            'ProductName=' + #13#10 +
            'ProductVersion=1.0.0.0' + #13#10 +
            'Comments=' + #13#10 +
            '[HistoryLists\hlUnitAliases]' + #13#10 +
            'Count=1' + #13#10 +
            'Item0=WinTypes=Windows;WinProcs=Windows;DbiTypes=BDE;DbiProcs=BDE;DbiErrs=BDE;' + #13#10 +
            '[HistoryLists\hlBPLOutput]' + #13#10 +
            'Count=1' + #13#10 +
            'Item0=C:\ProjetosCM5\CM\Packages' + #13#10 +
            '[HistoryLists\hlDCPOutput]' + #13#10 +
            'Count=1' + #13#10 +
            'Item0=C:\ProjetosCM5\CM\Packages';


  CMProjectFiles : array [TFileExtension] of string = (FileUModulo, FilePrincipalPas, FilePrincipalDfm, FileDof);
  CMProjectFilesName : array [TFileExtension] of string = ('uModulo%DPRNAME%.pas', 'fPrincipal.pas', 'fPrincipal.dfm', '%DPRNAME%.Dof');

implementation

end.
