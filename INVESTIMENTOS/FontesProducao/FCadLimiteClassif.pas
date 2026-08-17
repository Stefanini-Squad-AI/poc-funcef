//------------------------------------------------------------------
// Sistema  .: INVESTIMENTOS
// Objetivo .: Formulário de Cadastro de Limites por Classificacao
// Form     .: FrmCadLimiteClassif - Unit .: FCadLimiteClassif
// Data     .: 11/02/1999
//------------------------------------------------------------------
unit FCadLimiteClassif;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, Grids,
  DBGrids, Mask, wwdbedit, Wwdotdot, Wwdbcomb, DBCtrls, IvDictio, IvMulti,
  IvEMulti, CmEventosCadastro, ImgList;

type
  TFrmCadLimiteClassif = class(TfrmCadastroCS)
    RG1: TRadioGroup;
    QryDados: TwwQuery;
    DsDados: TwwDataSource;
    DbLkcDados: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    DbLkcTabClassif: TwwDBLookupCombo;
    QryBuscaTabClassif: TwwQuery;
    GroupBox1: TGroupBox;
    QryBuscaClassif: TwwQuery;
    QryBuscaClassifRef: TwwQuery;
    QryBuscaRegra: TwwQuery;
    DsBuscaTabClassif: TwwDataSource;
    DbLkcBuscaClassif: TwwDBLookupCombo;
    DbLkcBuscaClassifRef: TwwDBLookupCombo;
    Label3: TLabel;
    Label4: TLabel;
    DbCmbOperacao: TwwDBComboBox;
    Label5: TLabel;
    SB1: TSpeedButton;
    SB2: TSpeedButton;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    qryIDLIMCLASSINV: TFloatField;
    qryCODTABCLASSINV: TStringField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryIDFUNDOINVEST: TFloatField;
    qryCODCLASSINVEST: TStringField;
    qryCODCLASSREF: TStringField;
    qryIDPLANOINVEST: TFloatField;
    qryPERCLIMCLASSINV: TFloatField;
    qryIDREGRALIMCLASS: TFloatField;
    qryOPLIMCLASSINV: TStringField;
    DbLkcRegra: TwwDBLookupCombo;
    Label7: TLabel;
    CheckBox1: TCheckBox;
    procedure RG1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DbLkcDadosChange(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure DbLkcTabClassifChange(Sender: TObject);
    procedure SB1Click(Sender: TObject);
    procedure SB2Click(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadLimiteClassif: TFrmCadLimiteClassif;
  wCampoId           : String;

implementation

Uses  UDataBase, UBibliotecaInvest, FBuscaClassif;
{$R *.DFM}

//-------------------------------------------------------
// Click do RadioGruop
procedure TFrmCadLimiteClassif.RG1Click(Sender: TObject);
begin
  inherited;
// Troca Dados da Pesquisa de Acordo com o Item Escolhido No RG1
  Case RG1.ItemIndex Of

    0:Begin
// Monta Qry de Carteira de Investimento
      Label1.Caption:='Indique a Carteira de Investimento ';
      QryDados.Close;
      QryDados.Sql.Clear;
      wCampoId:='IDCARTEIRAINVEST';
      QryDados.Sql.Add('SELECT DESCCARTINVEST, IDCARTEIRAINVEST, IDGESTORCARTEIRA, '+
                       wCampoId+' FROM CARTEIRAINVEST');
// Altera Dados do ComboBox
      With DbLkcDados Do Begin
        DataField  :='';
        DataField  :='IDCARTEIRAINVEST';
        LookupField:='';
        LookupField:='IDCARTEIRAINVEST';
        Selected.Clear;
        Selected.Add('DESCCARTINVEST'+#9+'40'+#9+'Carteira de Investimento');
      End;
// Abre a Query
      QryDados.Open;
    End;
    1:Begin
// Monta Qry de Fundo de Investimento
      Label1.Caption:='Indique o Fundo de Investimento ';
      QryDados.Close;
      QryDados.Sql.Clear;
      wCampoId:='IDFUNDOINVEST';
      QryDados.Sql.Add('SELECT DESCFUNDOINVEST, IDFUNDOINVEST, IDGESTORCARTEIRA, '+
                       wCampoId+' FROM FUNDOINVEST');
// Altera Dados do ComboBox
      With DbLkcDados Do Begin
        DataField  :='';
        DataField  :='IDFUNDOINVEST';
        LookupField:='';
        LookupField:='IDFUNDOINVEST';
        Selected.Clear;
        Selected.Add('DESCFUNDOINVEST'+#9+'40'+#9+'Fundo de Investimento');
      End;
// Abre a Query
      QryDados.Open;
    End;
    2:Begin
// Monta Qry de Plano de Investimento
      Label1.Caption:='Indique o Plano de Investimento ';
      QryDados.Close;
      QryDados.Sql.Clear;
      wCampoId:='IDPLANOINVEST';
      QryDados.Sql.Add('SELECT DESCPLANOINVEST, IDPLANOINVEST, IDGESTORCARTEIRA, '+
                       wCampoId+' FROM PLANOINVEST');
// Altera Dados do ComboBox
      With DbLkcDados Do Begin
        DataField  :='';
        DataField  :='IDPLANOINVEST';
        LookupField:='';
        LookupField:='IDPLANOINVEST';
        Selected.Clear;
        Selected.Add('DESCPLANOINVEST'+#9+'40'+#9+'Plano de Investimento');
      End;
// Abre a Query
      QryDados.Open;
    End;
  End;
end;

//-------------------------------------------------------
// Mostra Formulario
procedure TFrmCadLimiteClassif.FormShow(Sender: TObject);
begin
  inherited;
// Abre Querys
  QryBuscaTabClassif.Open;
  Qry.Open;
  QryBuscaClassif.Open;
  QryBuscaClassifRef.Open;
  QryBuscaRegra.Open;
// Executa Mudanca no RadioGroup
  RG1Click(Self);
end;
//-------------------------------------------------------
// Fecha Formulario
procedure TFrmCadLimiteClassif.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
// Fecha Querys
  Qry.Close;
  QryBuscaTabClassif.Close;
  QryBuscaClassif.Close;
  QryBuscaClassifRef.Close;
  QryBuscaRegra.Close;
end;

//---------------------------------------------------------------
// Mudanca no Grupo de Tipos
procedure TFrmCadLimiteClassif.DbLkcDadosChange(Sender: TObject);
begin
  inherited;
// Desabilita RadioGroup
  RG1.Enabled :=False;
end;

//---------------------------------------------------------------
// Botao Cancelar
procedure TFrmCadLimiteClassif.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
// Habilita RadioGroup
//  RG1.Enabled :=True;
// Inabilita Botoes
  SB1.Enabled := False;
  SB2.Enabled := False;
  CheckBox1.Checked := False;
  CheckBox1.Enabled := False;
end;

//---------------------------------------------------------------
// Botao Confirmar (OK)
procedure TFrmCadLimiteClassif.bbtnConfirmarClick(Sender: TObject);
begin
// Caso Inserindo Calcula ID
  If sbtnInserir.Down = True Then Begin
    Qry.FieldByName('IDLIMCLASSINV').AsInteger := LeUltRegistro(Nil,'LIMITECLASSINV');
    DbLkcBuscaClassif.Text    :='';
    DbLkcBuscaClassifRef.Text :='';
  End Else Begin
    SB1.Enabled := False;
    SB2.Enabled := False;
    CheckBox1.Enabled := False;
  End;
// Heranca
  Inherited;
end;

//---------------------------------------------------------------
// Mudanca no Combo de Tabelas
procedure TFrmCadLimiteClassif.DbLkcTabClassifChange(Sender: TObject);
begin
  inherited;
// Remonta a Qry de Classificacao
  FazQuery(QryBuscaClassif,
             'SELECT 	CODTABCLASSINV, CODCLASSINVEST, DESCCLASSINVEST, CLASSIFANALIT '+
             'FROM CLASSIFINVEST '+
             'WHERE 	(CODTABCLASSINV = '''+
               QryBuscaTabClassif.FieldByName('CODTABCLASSINV').AsString+''') '+
             'ORDER BY DESCCLASSINVEST' );

// Remonta a Qry de Classificacao, Referencia
  FazQuery(QryBuscaClassifRef,
             'SELECT 	CODTABCLASSINV, CODCLASSINVEST, DESCCLASSINVEST, CLASSIFANALIT '+
             'FROM CLASSIFINVEST '+
             'WHERE 	(CODTABCLASSINV = '''+
               QryBuscaTabClassif.FieldByName('CODTABCLASSINV').AsString+''') '+
             'ORDER BY DESCCLASSINVEST' );
  If DS.State In ([DsInsert]) Then Begin
    DbLkcBuscaClassif.Text    :='';
    DbLkcBuscaClassifRef.Text :='';
  End;

end;

//---------------------------------------------------------------
// Busca a Classificacao Principal
procedure TFrmCadLimiteClassif.SB1Click(Sender: TObject);
begin
  inherited;
// Carrega Formulario de Consulta de Classificacoes
  Application.CreateForm(TFrmBuscaClassif, FrmBuscaClassif);
  FrmBuscaClassif.wCodTabelaClassif  :=
    QryBuscaTabClassif.FieldByName('CODTABCLASSINV').AsString;
  FrmBuscaClassif.wDescTabelaClassif :=
    QryBuscaTabClassif.FieldByName('DESCTABCLASSINV').AsString;
// Mostra Formulario
  FrmBuscaClassif.ShowModal;
// Busca Informacao
  If FrmBuscaClassif.wClassifEscolhida <> '' Then
    Qry.FieldByName('CODCLASSINVEST').AsString :=
      FrmBuscaClassif.wClassifEscolhida;
// Destroy Formulario
  FrmBuscaClassif.Free;
end;

//---------------------------------------------------------------
// Busca a Classificacao Referencia
procedure TFrmCadLimiteClassif.SB2Click(Sender: TObject);
begin
  inherited;
// Carrega Formulario de Consulta de Classificacoes
  Application.CreateForm(TFrmBuscaClassif, FrmBuscaClassif);
  FrmBuscaClassif.wCodTabelaClassif :=
    QryBuscaTabClassif.FieldByName('CODTABCLASSINV').AsString;
  FrmBuscaClassif.wDescTabelaClassif :=
    QryBuscaTabClassif.FieldByName('DESCTABCLASSINV').AsString;
// Mostra Formulario
  FrmBuscaClassif.ShowModal;
// Busca Informacao
  If FrmBuscaClassif.wClassifEscolhida <> '' Then
    Qry.FieldByName('CODCLASSREF').AsString :=
      FrmBuscaClassif.wClassifEscolhida;
// Destroy Formulario
  FrmBuscaClassif.Free;
end;

//---------------------------------------------------------------
// Botao Procurar
procedure TFrmCadLimiteClassif.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  If (MontaSelect.ValoresChave.Count > 0) And
     (MontaSelect.ValoresChave[0] <> '') Then
     Begin
     Qry.Locate('IDLIMCLASSINV',MontaSelect.ValoresChave[0],[]);
  End;
end;

//---------------------------------------------------------------
// Depois de Rolar na Query
procedure TFrmCadLimiteClassif.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
// Muda o Radio Group de Acordo com a Query
  If Qry.FieldByName('IDCARTEIRAINVEST').AsString <> '' Then
    RG1.ItemIndex := 0
  Else If Qry.FieldByName('IDFUNDOINVEST').AsString <> '' Then
    RG1.ItemIndex := 1
  Else If Qry.FieldByName('IDPLANOINVEST').AsString <> '' Then
    RG1.ItemIndex := 2;
  CheckBox1.Checked := (Qry.FieldByName('CODCLASSREF').AsString = '');
end;

//---------------------------------------------------------------
// Botao Inserir
procedure TFrmCadLimiteClassif.sbtnInserirClick(Sender: TObject);
begin
  inherited;
// Desabilita RadioGroup
  RG1.Enabled :=True;
// Habilita Botoes
  SB1.Enabled := True;
//  SB2.Enabled := True;
  CheckBox1.Enabled := True;
// Limpa Combos
  DbLkcBuscaClassif.Text    :='';
  DbLkcBuscaClassifRef.Text := '';
end;

//---------------------------------------------------------------
// Botao Alter
procedure TFrmCadLimiteClassif.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
// Inabilita Botoes
  SB1.Enabled := True;
  SB2.Enabled := True;
  If CheckBox1.Checked Then Begin
    DbLkcBuscaClassifRef.Enabled := False;
    SB2.Enabled := False;
  End;
  CheckBox1.Enabled := True;
end;

procedure TFrmCadLimiteClassif.CheckBox1Click(Sender: TObject);
begin
  inherited;
  If CheckBox1.Checked Then Begin
    DbLkcBuscaClassifRef.Enabled := False;
    DbLkcBuscaClassifRef.Text    := ''; 
    SB2.Enabled := False;
    If Ds.DataSet.State In [DsEdit, DsInsert] Then
      Qry.FieldByName('CODCLASSREF').AsString := '';
  End Else Begin
    If Ds.DataSet.State In [DsEdit, DsInsert] Then
      SB2.Enabled := True;
      DbLkcBuscaClassifRef.Enabled := True;
  End;
end;

end.
