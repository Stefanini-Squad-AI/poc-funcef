unit CMFormWizards;

interface

uses
  ToolsAPI, Windows, CMOTAFile, dialogs;

type
  TCMFormWizard = class(TNotifierObject, IOTAFormWizard, IOTARepositoryWizard, IOTAWizard)
  public
    // IOTAWizard
    function GetIDString: string;
    function GetName: string; virtual;
    function GetState: TWizardState;
    procedure Execute; virtual;
    // IOTARepositoryWizard
    function GetAuthor: string;
    function GetComment: string; virtual;
    function GetPage: string;
    function GetGlyph: HICON; virtual;
  end;

  TCMFormPaiWizard = class(TCMFormWizard)
  public
    function GetName: string; override;
    procedure Execute; override;
    function GetComment: string; override;
    function GetGlyph: HICON; override;
  end;

  TCMTelaAutWizard = class(TCMFormWizard)
  public
    function GetName: string; override;
    procedure Execute; override;
    function GetComment: string; override;
    function GetGlyph: HICON; override;
  end;

  TCMSairAjudaWizard = class(TCMFormWizard)
  public
    function GetName: string; override;
    procedure Execute; override;
    function GetComment: string; override;
    function GetGlyph: HICON; override;
  end;

  TCMOkCancelaWizard = class(TCMFormWizard)
  public
    function GetName: string; override;
    procedure Execute; override;
    function GetComment: string; override;
    function GetGlyph: HICON; override;
  end;

  TCMCadastroCSWizard = class(TCMFormWizard)
  public
    function GetName: string; override;
    procedure Execute; override;
    function GetComment: string; override;
    function GetGlyph: HICON; override;
  end;

  TCMCadastroMestreDetCS = class(TCMFormWizard)
  public
    function GetName: string; override;
    procedure Execute; override;
    function GetComment: string; override;
    function GetGlyph: HICON; override;
  end;

  TCMCadastroGridCS = class(TCMFormWizard)
  public
    function GetName: string; override;
    procedure Execute; override;
    function GetComment: string; override;
    function GetGlyph: HICON; override;
  end;

procedure Register;

implementation

uses
  SysUtils, ShellAPI, CMModuleCreator, FSM_FxLib;

procedure Register;
begin
  RegisterPackageWizard(TCMFormPaiWizard.Create);
  RegisterPackageWizard(TCMTelaAutWizard.Create);
  RegisterPackageWizard(TCMSairAjudaWizard.Create);
  RegisterPackageWizard(TCMOkCancelaWizard.Create);
  RegisterPackageWizard(TCMCadastroCSWizard.Create);
  RegisterPackageWizard(TCMCadastroGridCS.Create);
  RegisterPackageWizard(TCMCadastroMestreDetCS.Create);
end;

{ TCMFormWizard }

procedure TCMFormWizard.Execute;
begin
end;

function TCMFormWizard.GetAuthor: string;
begin
  Result := 'CM Soluções Informática';
end;

function TCMFormWizard.GetComment: string;
begin
  Result := '';
end;

function TCMFormWizard.GetGlyph: HICON;
begin
  Result := 0;
end;

function TCMFormWizard.GetIDString: string;
begin
  Result := 'cmsolucoes.' + ClassName;
end;

function TCMFormWizard.GetName: string;
begin
  Result := ClassName;
end;

function TCMFormWizard.GetPage: string;
begin
  Result := 'CM Soluções';
end;

function TCMFormWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

{ TCMSairAjudaWizard }

procedure TCMSairAjudaWizard.Execute;
begin
  try
    (BorlandIDEServices as IOTAModuleServices).CreateModule(TCMModuleCreator.Create('FrmSairAjuda'));
  except
    MsgError('É necessário possuir um Projeto Padrão CM aberto ou possuir a tela FrmSairAjuda aberta para utilizar esta opção');
  end;
end;

function TCMSairAjudaWizard.GetComment: string;
begin
  Result := 'Cria um novo Form SairAjuda';
end;

function TCMSairAjudaWizard.GetGlyph: HICON;
begin
  try
    Result := ExtractIcon(HINSTANCE, 'CMExperts.bpl', 1);
  except
    Result := 0;
  end;
end;

function TCMSairAjudaWizard.GetName: string;
begin
  Result := 'Form SairAjuda';
end;

{ TCMCadastroCSWizard }

procedure TCMCadastroCSWizard.Execute;
begin
  try
    (BorlandIDEServices as IOTAModuleServices).CreateModule(TCMModuleCreator.Create('FrmCadastroCS'));
  except
    MsgError('É necessário possuir um Projeto Padrão CM aberto ou possuir a tela FrmCadastroCS aberta para utilizar esta opção');
  end;
end;

function TCMCadastroCSWizard.GetComment: string;
begin
  REsult := 'Cria uma nova tela de cadastro';
end;

function TCMCadastroCSWizard.GetGlyph: HICON;
begin
  try
    Result := ExtractIcon(HINSTANCE, 'CMExperts.bpl', 7);
  except
    Result := 0;
  end;
end;

function TCMCadastroCSWizard.GetName: string;
begin
  Result := 'Form de Cadastro';
end;

{ TCMFormPaiWizard }

procedure TCMFormPaiWizard.Execute;
begin
  try
    (BorlandIDEServices as IOTAModuleServices).CreateModule(TCMModuleCreator.Create('FrmPai'));
  except
    MsgError('É necessário possuir um Projeto Padrão CM aberto ou possuir a tela FrmPai aberta para utilizar esta opção');
  end;
end;

function TCMFormPaiWizard.GetComment: string;
begin
  Result := 'Cria um novo form padrão CM';
end;

function TCMFormPaiWizard.GetGlyph: HICON;
begin
  try
    Result := ExtractIcon(HINSTANCE, 'CMExperts.bpl', 6);
  except
    Result := 0;
  end;
end;

function TCMFormPaiWizard.GetName: string;
begin
  Result := 'Form CM';
end;

{ TCMTelaAutWizard }

procedure TCMTelaAutWizard.Execute;
begin
  try
    (BorlandIDEServices as IOTAModuleServices).CreateModule(TCMModuleCreator.Create('FrmTelaAut'));
  except
    MsgError('É necessário possuir um Projeto Padrão CM aberto ou possuir a tela FrmTelaAut aberta para utilizar esta opção');
  end;
end;

function TCMTelaAutWizard.GetComment: string;
begin
  Result := 'Cria um novo form padrão CM com controle de autorização';
end;

function TCMTelaAutWizard.GetGlyph: HICON;
begin
  try
    Result := ExtractIcon(HINSTANCE, 'CMExperts.bpl', 5);
  except
    Result := 0;
  end;
end;

function TCMTelaAutWizard.GetName: string;
begin
  Result := 'Form com Controle de Autorização';
end;

{ TCMOkCancelaWizard }

procedure TCMOkCancelaWizard.Execute;
begin
  try
    (BorlandIDEServices as IOTAModuleServices).CreateModule(TCMModuleCreator.Create('FrmOkCancelar'));
  except
    MsgError('É necessário possuir um Projeto Padrão CM aberto ou possuir a tela FrmOkCancelar aberta para utilizar esta opção');
  end;
end;

function TCMOkCancelaWizard.GetComment: string;
begin
  Result := 'Cria um novo Form OKCancela';
end;

function TCMOkCancelaWizard.GetGlyph: HICON;
begin
  try
    Result := ExtractIcon(HINSTANCE, 'CMExperts.bpl', 1);
  except
    Result := 0;
  end;
end;

function TCMOkCancelaWizard.GetName: string;
begin
  Result := 'Form OkCancela';
end;

{ TCMCadastroMestreDetCS }

procedure TCMCadastroMestreDetCS.Execute;
begin
  try
    (BorlandIDEServices as IOTAModuleServices).CreateModule(TCMModuleCreator.Create('FrmCadMestreDetalheCS'));
  except
    MsgError('É necessário possuir um Projeto Padrão CM aberto ou possuir a tela FrmCadMestreDetalheCS aberta para utilizar esta opção');
  end;
end;

function TCMCadastroMestreDetCS.GetComment: string;
begin
  Result := 'Cria um novo Form Mestre Detalhe CS';
end;

function TCMCadastroMestreDetCS.GetGlyph: HICON;
begin
  try
    Result := ExtractIcon(HINSTANCE, 'CMExperts.bpl', 4);
  except
    Result := 0;
  end;
end;

function TCMCadastroMestreDetCS.GetName: string;
begin
  Result := 'Form Mestre Detalhe CS';
end;

{ TCMCadastroGridCS }

procedure TCMCadastroGridCS.Execute;
begin
  try
    (BorlandIDEServices as IOTAModuleServices).CreateModule(TCMModuleCreator.Create('FrmCadastroGridCS'));
  except
    MsgError('É necessário possuir um Projeto Padrão CM aberto ou possuir a tela FrmCadastroGridCS aberta para utilizar esta opção');
  end;
end;

function TCMCadastroGridCS.GetComment: string;
begin
  Result := 'Cria um novo Form Cadastro Grid CS';
end;

function TCMCadastroGridCS.GetGlyph: HICON;
begin
  try
    Result := ExtractIcon(HINSTANCE, 'CMExperts.bpl', 3);
  except
    Result := 0;
  end;
end;

function TCMCadastroGridCS.GetName: string;
begin
  Result := 'Form Cadastro Grid CS';
end;

end.
