unit FCadConjuntoRubrica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  {$IFDEF VERSAO0505} uComum, {$ELSE} uCMTypes, {$ENDIF}
  UFuncoesPrevMT50, uCtrlPadroes, uCtrlConjuntoRubrica, uSistema,
  dBaseDados, uMensErro, wwdbedit, Mask, DBCtrls, Provider, DBTables;

type
  TFrmCadConjuntoRubrica = class(TFrmCadastroMT)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    EdDescricao: TwwDBEdit;
    Query1: TQuery;
    DataSource1: TDataSource;
    DataSetProvider1: TDataSetProvider;
    CdsIDCONJUNTORUBRICA: TFloatField;
    CdsDESCRICAO: TStringField;
    CdsCODIGO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
  private
    { Private declarations }
    CtrlConjuntoRubrica : TCtrlConjuntoRubrica;
    sDescricaoConjuntoRubrica : String;


    procedure MessageCtrlConjuntoRubrica( sMessageInfo : String);

  public
    { Public declarations }
  end;

var
  FrmCadConjuntoRubrica: TFrmCadConjuntoRubrica;

implementation

{$R *.DFM}

procedure TFrmCadConjuntoRubrica.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlConjuntoRubrica := TCtrlConjuntoRubrica.Create;

  CtrlConjuntoRubrica.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                 Sistema.ConnectionSide, Sistema.AppRemoteServer,
                                 True, MessageCtrlConjuntoRubrica );

  Cds.CreateDataSet;

end;

procedure TFrmCadConjuntoRubrica.MessageCtrlConjuntoRubrica(sMessageInfo: String);
begin

  MsgDlg(sMessageInfo, 'Erro', mtError, [mbOk],0)

end;

procedure TFrmCadConjuntoRubrica.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if MontaSelect.RetornouValor then
    Cds.Data := CtrlConjuntoRubrica.SelecionaConjuntoRubrica( StrToInt( MontaSelect.ValoresChave[0] ) );

end;

procedure TFrmCadConjuntoRubrica.CmeCadastroConfirma(Sender: TObject);
Var
  sTextoLog : String;
begin
  inherited;

  { Gravar log de operação }
  If cmecadastro.Operacao = OpInserir then
    sTextoLog := 'Inclusão do conjunto de rubricas '+DBEdit1.Text
  Else If cmecadastro.Operacao = OpAlterar then
    sTextoLog := 'Manutenção do conjunto de rubricas '+DBEdit1.Text
  Else If cmecadastro.Operacao = OpApagar then
    sTextoLog := 'Exclusão do conjunto de rubricas '+sDescricaoConjuntoRubrica;

  If Not GravaLogOperacao(sTextoLog) Then Begin { Função está em UFuncoesPrevMT50 }
    Raise Exception.Create( 'Erro ao gravar o log da Operação ' );
    Exit;
  End;


  { Transfere dados do Forumlário para o Control e confirma }
  CtrlConjuntoRubrica.CdsConjuntoRubrica.Data := Cds.Data;
  CtrlConjuntoRubrica.GravaConjuntoRubrica;

  { Refaz pesquisa com novos Dados }
  if MontaSelect.RetornouValor then
    Cds.Data := CtrlConjuntoRubrica.SelecionaConjuntoRubrica( StrToInt(MontaSelect.ValoresChave[0]) );


end;

procedure TFrmCadConjuntoRubrica.sbtnApagarClick(Sender: TObject);
begin
  sDescricaoConjuntoRubrica := DBEdit1.Text;
  inherited;

end;

procedure TFrmCadConjuntoRubrica.CmeCadastroBeforeConfirma(sender: TObject;
                                                           var Accept: Boolean);
begin
  inherited;

  If ( CtrlConjuntoRubrica.ExisteCodigo( Cds.FieldByName('IDCONJUNTORUBRICA').AsInteger,
                                         DBEdit1.Text ) )
  Then Begin

    MsgDlg( 'Código já existente.', 'Erro', mtError, [mbOk],0 );
    DBEdit1.SetFocus;

    Accept := False;

  End;

end;

procedure TFrmCadConjuntoRubrica.CmeCadastroInsert(Sender: TObject);
begin
  inherited;

  DBEdit1.SetFocus;

end;

procedure TFrmCadConjuntoRubrica.CmeCadastroEdit(Sender: TObject);
begin
  inherited;

  DBEdit1.SetFocus;

end;

end.
