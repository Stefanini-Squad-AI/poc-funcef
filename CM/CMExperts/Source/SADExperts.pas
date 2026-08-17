unit SADExperts;

// 18/03/04 Alex - Criar o formulário para arquivo de resource para vesão do produto

interface

uses
  Windows, SysUtils, Classes, Forms, Menus, Controls,
  ToolIntf, ExptIntf, DsgnIntf, TypInfo, CMExpert, Dialogs;

type
  TLiberaVersaoXPRT = class(TCMExpert)
  private
    _ReleaseVersMenuItem: TIMenuItemIntf;
  protected
    procedure DoClick(Sender: TIMenuItemIntf); override;
  public
    constructor Create;
    destructor Destroy; override;
  end;


  TBuscaStringsXPRT = class(TCMExpert)
  private
    _BuscaStringsItem: TIMenuItemIntf;
  protected
    procedure DoClick(Sender: TIMenuItemIntf); override;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TResouceXPRT = class(TCMExpert)
  private
    _ResourceItem: TIMenuItemIntf;
  protected
    procedure DoClick(Sender: TIMenuItemIntf); override;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TCGC = class(TCMExpert)
  private
    _CGCItem: TIMenuItemIntf;
  protected
    procedure DoClick(Sender: TIMenuItemIntf); override;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TMonitor = class(TCMExpert)
  private
    _MonitorItem: TIMenuItemIntf;
  protected
    procedure DoClick(Sender: TIMenuItemIntf); override;
  public
    constructor Create;
    destructor Destroy; override;
  end;



procedure Register;

implementation

uses
  fsadExpert, dSad, fAguarde, JCLShell, fResourceCM, fLocalizaUnitPacote;

procedure Register;
begin
  RegisterLibraryExpert(TLiberaVersaoXPRT.Create);
  RegisterLibraryExpert(TBuscaStringsXPRT.Create);
  RegisterLibraryExpert(TResouceXPRT.Create);
  RegisterLibraryExpert(TMonitor.Create);
  RegisterLibraryExpert(TCGC.Create);
end;

{ TLiberaVersaoXPRT }

constructor TLiberaVersaoXPRT.Create;
begin
  inherited Create;
  _ReleaseVersMenuItem := CreateCmMenuItem('SAD Expert', 5);
end;

destructor TLiberaVersaoXPRT.Destroy;
begin
  _ReleaseVersMenuItem.Free;
  inherited Destroy;
end;

procedure TLiberaVersaoXPRT.DoClick(Sender: TIMenuItemIntf);
begin
  If (Application.MessageBox('É aconselhável fechar todas as units e forms que estejam abertos. Deseja Executar o SAD Expert','Atenção',Mb_IconQuestion + Mb_YesNo) = Id_Yes) Then
  Begin
     frmAguarde := TfrmAguarde.Create(Application);
     dmSAD := TdmSad.Create(Application);
     With TFrmSADExpert.Create(Application) Do
        try
          ShowModal;
        finally
          free;
          dmSad.Free;
          frmAguarde.Free;
        end;
  End;
end;

constructor TBuscaStringsXPRT.Create;
begin
  Inherited Create;
  _BuscaStringsItem := CreateCmMenuItem('Prepara Strings Para Tradução', 6);
end;

destructor TBuscaStringsXPRT.Destroy;
begin
  _BuscaStringsItem.Free;
   inherited;
end;

procedure TBuscaStringsXPRT.DoClick(Sender: TIMenuItemIntf);
begin
  If (Application.MessageBox('Favor fechar todas as units e forms que estejam abertos. Deseja continuar ?' + (#13+#10) +
                             '( É aconselhável a leitura da documentação em ' + (#13+#10) +
                             '"c:\ProjetosCM5\CM\Doc\CMTraduz.Doc" antes de executar o utilitário. )','Atenção',Mb_IconQuestion + Mb_YesNo) = Id_Yes) Then
     ShellExec('c:\ProjetosCM5\bin\BuscaStrings.exe');
end;

{ TResouceXPRT }

constructor TResouceXPRT.Create;
begin
  inherited Create;
  _ResourceItem := CreateCmMenuItem('Gera arquivo de resource da Versão', 5);
end;

destructor TResouceXPRT.Destroy;
begin
  _ResourceItem.Free;
  inherited;
end;

procedure TResouceXPRT.DoClick(Sender: TIMenuItemIntf);
begin
  //Criar o formulário para arquivo de resource para vesão do produto
  With TfrmResourceCM.Create(Application) Do
     try
       ShowModal;
     finally
       free;
     end;
end;

{ TCGC }
constructor TCGC.Create;
begin
  inherited Create;
  _CGCItem := CreateCmMenuItem('CGC - Controle e Gerência de Compilação', 0);
end;

destructor TCGC.Destroy;
begin
  _CGCItem.Free;
  inherited;
end;

procedure TCGC.DoClick(Sender: TIMenuItemIntf);
begin
  With TfrmLocalizaUnitPacote.Create(Application) Do
  try
    ShowModal;
  finally
    free;
  end;
end;

{ TMonitor }

constructor TMonitor.Create;
begin
  inherited Create;
  _MonitorItem := CreateCmMenuItem('SQL - Monitor', 0);
end;

destructor TMonitor.Destroy;
begin
  _MonitorItem.Free;
  inherited;
end;

procedure TMonitor.DoClick(Sender: TIMenuItemIntf);
begin
  ShellExec('C:\Program Files\Borland\Delphi5\Bin\sqlmon.exe');
end;

end.
