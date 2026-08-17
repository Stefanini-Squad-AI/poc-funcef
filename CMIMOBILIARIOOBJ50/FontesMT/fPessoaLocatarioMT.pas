{-------------------------------------------------------------------------------

     CADASTRO DE PESSOA - LOCATARIO  ( MT )

     Módulo          :  Comuns Imobiliario
     Autor           :  Vinícius Meyer Lana
     Data de Início  :  26/09/2002
     Data de Término :  27/09/2002

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina............: FormCreate
N. Sol.............: 92381
N. Kintana......: 394180
Data...............: 18/09/2008
Responsável...: Cássio Camargo
Descrição........: Inclusão do Control Object CtrlImobDocumento, com o
                     objetivo de internalizar funcionalidades.
--------------------------------------------------------------------------------
Pendência   : 26442
Responsável : Daniel Simões
Data        : 27/09/2007
Descrição   : Correção no processo de gravação do locatário para gravar, alterar
              e excluir o Tipo de Cliente...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fPessoaLocatarioMT;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fpessoaMT, Menus, Db, MontaSelect, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97, Buttons, DBCtrls, ExtCtrls, CMProcura,
  StdCtrls, CheckLst, ComCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, Wwdbspin, TabControlDetalhe, Grids, Wwdbigrd, Wwdbgrid,
  Mask, wwdbedit, TB97Ctls, wwdblook, CMDBLookupCombo, TB97Tlwn, uCtrlSubConta,
  uCtrlTipoCliente, {uCtrlDocumento,} uCtrlParamIntegra,
  //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
  uCtrlImobDocumento;

type
  TfrmPessoaLocatarioMT = class(TFrmPessoaMT)
    cdsSubConta: TCMClientDataSet;
    tsCliente: TTabSheet;
    lblSubConta: TLabel;
    DBcboSubConta: TwwDBLookupCombo;
    Label2: TLabel;
    DBcboTipoCliente: TwwDBLookupCombo;
    cdsTipoCliente: TCMClientDataSet;
    cdsForCli: TCMClientDataSet;
    dsForCli: TwwDataSource;
    DsTipos: TwwDataSource;
    CdsTipos: TCMClientDataSet;
    DsTiposCli: TwwDataSource;
    CdsTiposCli: TCMClientDataSet;
    GrdTipos: TwwDBGrid;
    PnlTipos: TPanel;
    BtnDelTipos: TSpeedButton;
    BtnAddTipos: TSpeedButton;
    GrdTiposCli: TwwDBGrid;
    PnlTiposCli: TPanel;
    cdsClientePess: TCMClientDataSet;
    cdsCliente: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure BtnAddTiposClick(Sender: TObject);
    procedure BtnDelTiposClick(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }
    CtrlSubConta    : TCtrlSubConta;
    CtrlTipoCliente : TCtrlTipoCliente;
    //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
    //CtrlDocumento   : TCtrlDocumento;
    CtrlImobDocumento : TCtrlImobDocumento;
    procedure GravaCliente;
  public
    { Public declarations }
    procedure SelPessoa(rIdPessoa: Double); Override;    
  protected
    procedure SelSubTipo(rIdPessoa: Double); Override;
  end;

var
  frmPessoaLocatarioMT: TfrmPessoaLocatarioMT;

implementation

Uses dBaseDados, uCtrlPessoaLocatario, uCtrlPessoa, uSistema, uCMTypes,
     uModuloImobiliario;

{$R *.DFM}

{ TfrmPessoaLocatarioMT }



procedure TfrmPessoaLocatarioMT.FormCreate(Sender: TObject);
begin
  // Cria e inicializa o objeto de controle do subtipo ( já declarado no form pai )
  Pessoa := TCtrlPessoaLocatario.Create;
  Pessoa.Initialize(DtmBaseDados.dbBaseDados,True, Sistema.ConnectionType,
                    Sistema.ConnectionSide, Sistema.AppRemoteServer,True);

  // Atribui informações para o Subtipo
  Pessoa.SubTipo     := stLocatario;
  Pessoa.TipoPessoa  := tpOpcional;
  Pessoa.MudaCaption := False;
  Pessoa.FormCaption := Translate('Cadastro de Proprietários / Locatários');

  // Inicializa Cds de SubConta Contábil e tipo de cliente
  CtrlSubConta    := TCtrlSubConta.Create;
  CtrlTipoCliente := TCtrlTipoCliente.Create;
  //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
  //CtrlDocumento   := TCtrlDocumento.Create;
  CtrlImobDocumento := TCtrlImobDocumento.Create;
  CtrlSubConta.InitializeAs( Pessoa );
  CtrlTipoCliente.InitializeAs( Pessoa );
  //CtrlDocumento.InitializeAs( Pessoa );
  CtrlImobDocumento.InitializeAs(Pessoa);
  cdsSubConta.Data    := CtrlSubConta.ListSubConta( Sistema.IdEmpresa, 0 );
  cdsTipoCliente.Data := CtrlTipoCliente.ListaTipoCliente;

  TCtrlPessoaLocatario(Pessoa).cdsClientePess := cdsClientePess; // Daniel - 26442

  TCtrlPessoaLocatario(Pessoa).CdsTiposCli := CdsTiposCli;

  if ( (Sistema.IdModulo =  64) and (ModuloImobiliario.AdminImob.bFlgIntegraContab)  ) or
     ( (Sistema.IdModulo =  54) and (ModuloImobiliario.Investimob.bFlgIntegraContab) ) or
     ( (Sistema.IdModulo = 135) and (ModuloImobiliario.Alienacao.bFlgIntegraContab)  ) then begin
    dbCboSubConta.Enabled    := True;
    dbCboTipoCliente.Enabled := True;
  end else begin
    dbCboSubConta.Enabled    := False;
    dbCboTipoCliente.Enabled := False;
  end;

  inherited;
end;



procedure TfrmPessoaLocatarioMT.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlSubConta );
  FreeAndNil( CtrlTipoCliente );
  //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
  //FreeAndNil( CtrlDocumento );
  FreeAndNil(CtrlImobDocumento);
  inherited;
end;



procedure TfrmPessoaLocatarioMT.SelSubTipo(rIdPessoa: Double);
begin
  inherited;

  CdsSubTipo.Data     := TCtrlPessoaLocatario(Pessoa).SelecionaLocatario( rIdPessoa );
  cdsForCli.Data      := TCtrlPessoaLocatario(Pessoa).SelecionaForCli( rIdPessoa );
  CdsTipos.Data       := TCtrlPessoaLocatario(Pessoa).SelTipos( rIdPessoa );
  CdsTiposCli.Data    := TCtrlPessoaLocatario(Pessoa).SelTiposCli( rIdPessoa );
  cdsClientePess.Data := TCtrlPessoaLocatario(Pessoa).LookupClientePess( rIdPessoa ); // Daniel - 26442

  if not cdsForCli.isEmpty then begin
    DBcboTipoCliente.Text := cdsForCli.FieldByName('TIPOCLIENTE').asString;
    DBcboTipoCliente.PerformSearch;
  end;
end;



procedure TfrmPessoaLocatarioMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  DBcboTipoCliente.Clear;
end;



procedure TfrmPessoaLocatarioMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
// Daniel - 26442 - Início -----------------------------------------------------
  cdsClientePess.Data := TCtrlPessoaLocatario(Pessoa).LookupClientePess( cds.FieldByName('IDPESSOA').AsInteger );

  if cdsClientePess.IsEmpty then begin
     cdsClientePess.Insert;
     cdsClientePess.FieldByName('IDPESSOA').AsInteger := cds.FieldByName('IDPESSOA').AsInteger;
     cdsClientePess.Post;
  end;
// Daniel - 26442 - Fim --------------------------------------------------------

  CdsSubTipo.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;

  inherited;

  if Accept then GravaCliente;
end;



procedure TfrmPessoaLocatarioMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
// Daniel - 26442 - Início -----------------------------------------------------
  cdsClientePess.Data := TCtrlPessoaLocatario(Pessoa).LookupClientePess( cds.FieldByName('IDPESSOA').AsInteger );

  if cdsClientePess.IsEmpty then begin
    cdsClientePess.Insert;
    cdsClientePess.FieldByName('IDPESSOA').AsInteger := cds.FieldByName('IDPESSOA').AsInteger;
    cdsClientePess.Post;
  end;
// Daniel - 26442 - Fim --------------------------------------------------------

  inherited;
  if Accept then GravaCliente;
end;



procedure TfrmPessoaLocatarioMT.GravaCliente;
var sContaContabil, sCentroCusto: string;
    iPlano, iPessoa, iSubConta, iTipoCliente: integer;
begin
  iPessoa        := CdsSubTipo.FieldByName('IDLOCATARIO').AsInteger;
  iPlano         := ParamIntegra.Plano;
  iSubConta      := -1;
  sContaContabil := '';
  sCentroCusto   := '';
  iTipoCliente   := 0;
  if DBcboTipoCliente.LookupValue <> '' then iTipoCliente := StrToInt(DBcboTipoCliente.LookupValue);

  //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
  //CtrlDocumento.ForCli.Inserir(iPessoa, Sistema.IdEmpresa, iSubConta, iPlano, iTipoCliente,
  //                             sCentroCusto, '', sContaContabil, '', tfcCliente);
  CtrlImobDocumento.ForCli.Inserir(iPessoa, Sistema.IdEmpresa, iSubConta, iPlano, iTipoCliente,
                               sCentroCusto, '', sContaContabil, '', tfcCliente);
end;



procedure TfrmPessoaLocatarioMT.SelPessoa(rIdPessoa: Double);
begin
  // Usado pelo molLocatario para abrir o cadastro de pessoa
  inherited;
end;



procedure TfrmPessoaLocatarioMT.BtnAddTiposClick(Sender: TObject);
begin
  inherited;

  if (CmeCadastro.Operacao in [OpInserir, OpAlterar ]) and (not CdsTipos.IsEmpty) then begin
    CdsTiposCli.Append;
    CdsTiposCli.FieldByName('IDPESSOA').AsFloat      := Cds.FieldByName('IDPESSOA').AsFloat;
    CdsTiposCli.FieldByName('DESCRICAO').AsString    := CdsTipos.FieldByName('DESCRICAO').AsString;
    CdsTiposCli.FieldByName('IDTIPOCLIENTE').AsFloat := CdsTipos.FieldByName('IDTIPOCLIENTE').AsFloat;
    CdsTiposCli.Post;

    CdsTipos.Delete;
  end;
end;



procedure TfrmPessoaLocatarioMT.BtnDelTiposClick(Sender: TObject);
begin
   inherited;
   If (CmeCadastro.Operacao In [OpInserir, OpAlterar ]) And
      (Not CdsTiposCli.IsEmpty) Then
   Begin
     CdsTipos.Append;
     CdsTipos.FieldByName('DESCRICAO').AsString    := CdsTiposCli.FieldByName('DESCRICAO').AsString;
     CdsTipos.FieldByName('IDTIPOCLIENTE').AsFloat := CdsTiposCli.FieldByName('IDTIPOCLIENTE').AsFloat;
     CdsTipos.Post;

     CdsTiposCli.Delete;
   End;
end;



procedure TfrmPessoaLocatarioMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
   cdsClientePess.Delete; // Daniel - 26442
   CdsTiposCli.First;
   while not CdsTiposCli.eof do CdsTiposCli.Delete;


   inherited;

   if Accept then GravaCliente;

end;


end.
