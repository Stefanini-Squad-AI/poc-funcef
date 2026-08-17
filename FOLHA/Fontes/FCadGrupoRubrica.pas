unit FCadGrupoRubrica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, CmEventosCadastro, ImgList, Db, Wwdatsrc,
  MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask, DBCtrls, Grids,
  DBGrids, Wwdbigrd, Wwdbgrid, wwdblook, dBaseDados, uSistema, uObjFolha;

type
  TFrmCadGrupoRubrica = class(TfrmCadastroCS)
    qryIDGRUPORUBRICA: TStringField;
    qryDESCRICAO: TStringField;
    pnl: TPanel;
    LblIdGrupoRubrica: TLabel;
    dbedtIdGrupoRubrica: TDBEdit;
    LblDescricao: TLabel;
    dbedDescricaoDoGrupo: TDBEdit;
    LblRubricaxGrupo: TLabel;
    qryRubricaxGrupo: TwwQuery;
    dsRubricaxGrupo: TwwDataSource;
    dbgRubricaxGrupo: TwwDBGrid;
    qryInfRendimento: TwwQuery;
    grbInfRendimento: TGroupBox;
    dblkInfRendimento: TwwDBLookupCombo;
    Bevel1: TBevel;
    Bevel2: TBevel;
    btnExecOp: TBitBtn;
    qryAux: TwwQuery;
    qryAuxIDPROVENTO: TFloatField;
    qryAuxIDINFORME: TFloatField;
    qryIDFUNDACAO: TFloatField;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExecOpClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Seleciona(sidGrupoRub: String);
    procedure MontaQryRubrica(sIdRubrica : String);
  public
    { Public declarations }
    sIdGrupoRubrica : String; 
  end;

var
  FrmCadGrupoRubrica: TFrmCadGrupoRubrica;

implementation

Uses uDataBase, uMensErro, uAdmPrevFB;

{$R *.DFM}

procedure TFrmCadGrupoRubrica.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
    Seleciona(MontaSelect.ValoresChave[0]);
    sIdGrupoRubrica := MontaSelect.ValoresChave[0]; 
    MontaQryRubrica(sIdGrupoRubrica); 
    qryRubricaxGrupo.Open;
  End;
end;

procedure TFrmCadGrupoRubrica.Seleciona(sidGrupoRub: String);
begin
  qry.Close;
  qry.ParamByName('IDGRUPORUBRICA').AsString := sidGrupoRub;
  qry.Open;
end;

procedure TFrmCadGrupoRubrica.FormShow(Sender: TObject);
begin
  inherited;
  Seleciona('-1');
  qryInfRendimento.Open;
  qryAux.Open;
end;

procedure TFrmCadGrupoRubrica.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  dbedDescricaoDoGrupo.SetFocus;
  qryIDGRUPORUBRICA.AsInteger:=LeUltRegistro(Nil,'GRUPORUBRICA');
  MontaQryRubrica(sIdGrupoRubrica); 
  qryRubricaxGrupo.Open;
  dbedtIdGrupoRubrica.Text    := qryIDGRUPORUBRICA.asstring;
  dbedtIdGrupoRubrica.Enabled := False;
  LblIdGrupoRubrica.Enabled   := False;
  grbInfRendimento.Enabled    := False;
end;

procedure TFrmCadGrupoRubrica.bbtnConfirmarClick(Sender: TObject);
begin
  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  if not Sistema.GravaLogOperacoes('Cadastro de grupo de rubrica.') then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  CmeCadastro.RepetirInsert   := False;
  inherited;
  LblIdGrupoRubrica.Enabled   := True;
  dbedtIdGrupoRubrica.Enabled := True;
end;

procedure TFrmCadGrupoRubrica.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  If (Trim(dbedDescricaoDoGrupo.Text) = '') Then
  Begin
    ShowMessage('Digite o Nome do Grupo da Rubrica.');
    If dbedDescricaoDoGrupo.CanFocus Then
      dbedDescricaoDoGrupo.SetFocus;
    Accept := False;
    exit;
  End;
  Accept := True;
  inherited;
end;

procedure TFrmCadGrupoRubrica.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  dbedtIdGrupoRubrica.Enabled := False;
  LblIdGrupoRubrica.Enabled   := False;
  grbInfRendimento.Enabled    := True;
end;

procedure TFrmCadGrupoRubrica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryInfRendimento.Close;
  qryAux.Close;
end;

procedure TFrmCadGrupoRubrica.btnExecOpClick(Sender: TObject);
Var
  sSql       : String;
  iIdInforme : Integer;

begin
  inherited;
  If Trim(dblkInfRendimento.Text) = '' Then
  Begin
    ShowMessage('Por Favor, escolha a linha do informe de rendimento.');
    Exit;
  End
  Else
    iIdInforme := qryInfRendimento.FieldByName('IDINFORME').AsInteger;


  If Not qryRubricaxGrupo.IsEmpty Then
  Begin
    If MsgDlg('Deseja realmente fazer a alteração?', 'Confirmação', mtConfirmation,
      [mbYes, mbNo, mbHelp], 0) = mrYes Then
    Begin

      While Not qryRubricaxGrupo.Eof Do
      Begin
        qryAux.SQL.Clear;
        qryAux.Sql.Add(
          ' UPDATE PROVDESC                         '+
          ' SET IDINFORME = ' + IntToStr(iIdInforme) +
          ' WHERE IDPROVENTO =  '+ IntToStr(qryRubricaxGrupo.FieldByName('IDPROVENTO').AsInteger));
        qryAux.ExecSQL;
        qryRubricaxGrupo.Next;
      End; { While Not qryRubricaxGrupo.Eof Do Begin }

      MontaQryRubrica(sIdGrupoRubrica); 
      qryRubricaxGrupo.Open;
    End;
  End
  Else
    ShowMessage('Não há nenhuma rubrica associada a esse grupo.');

  dblkInfRendimento.Clear;
end;

procedure TFrmCadGrupoRubrica.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  MontaQryRubrica(sIdGrupoRubrica); 
  qryRubricaxGrupo.Open;
end;

procedure TFrmCadGrupoRubrica.sbtnApagarClick(Sender: TObject);
begin
  qryRubricaxGrupo.First;
  if Not qryRubricaxGrupo.IsEmpty then
  begin
    if qryRubricaxGrupo.RecordCount > 1 then
      ShowMessage('Não será possível excluir esse grupo, pois existe rubricas associadas ao mesmo.')
    else
      ShowMessage('Não será possível excluir esse grupo, pois existe uma rubrica associada ao mesmo.');
    sbtnApagar.Down := False;
    Exit;
  end;
  inherited;
end;

procedure TFrmCadGrupoRubrica.MontaQryRubrica(sIdRubrica : String);
begin
  If SistemaFolha.FlgUsaCodRubExt = 0 Then
  Begin
    qryRubricaxGrupo.Sql.Clear;
    qryRubricaxGrupo.Sql.Add(
    ' SELECT P.IDPROVENTO, P.IDPROVENTO AS CODIGO, '+
    ' P.DESCRICAO AS DESCRICAO, I.IDINFORME, I.NOMEINFORME '+
    ' FROM PROVDESC P, GRUPORUBRICA G, INFORME I '+
    ' WHERE G.IDGRUPORUBRICA = '+QuotedStr(sIdRubrica)+
      ' AND G.IDGRUPORUBRICA = P.IDGRUPORUBRICA '+
      ' AND P.IDINFORME = I.IDINFORME(+) '+
      ' AND NVL(P.IDFUNDACAO, 0) = NVL(G.IDFUNDACAO, 0) ');
  End
  Else
  Begin
    qryRubricaxGrupo.Sql.Clear;
    qryRubricaxGrupo.Sql.Add(
    ' SELECT P.IDPROVENTO, P.CODPROVDESC AS CODIGO, '+
    ' P.DESCRPROVDESC AS DESCRICAO, I.IDINFORME, I.NOMEINFORME '+
    ' FROM PROVDESC P, GRUPORUBRICA G, INFORME I '+
    ' WHERE G.IDGRUPORUBRICA = '+QuotedStr(sIdRubrica)+
      ' AND G.IDGRUPORUBRICA = P.IDGRUPORUBRICA '+
      ' AND P.IDINFORME = I.IDINFORME(+) '+
      ' AND NVL(P.IDFUNDACAO, 0) = NVL(G.IDFUNDACAO, 0) ');
  End;
end;

end.
{------------------------------------------------------------------------------|
| UNIT: FCADGRUPORUBRICA                                                       |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   CADASTRO DE GRUPO DE RUBRICAS. PERMITE ALTERAR LINHA DE INFORME DE RENDI-  |
| MENTOS DAS RUBRICAS ASSOCIADAS A ESTE GRUPO.                                 |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 14/07/2003 A 14/07/2003                         |
| PENDÊNCIA: 14535                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.00                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAR PARA MULTIFUNDACAO.                                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 01/12/2004 A 01/12/2004                         |
| PENDÊNCIA: 18199                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.14a                                              |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - RETIRAR OS FIIELDS FIXOS DA QUERY QRYRUBRICAXGRUPO.                        |
|                                                                              |
|------------------------------------------------------------------------------}

