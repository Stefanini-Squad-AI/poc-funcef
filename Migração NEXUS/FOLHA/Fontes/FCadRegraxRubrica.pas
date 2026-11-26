{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit FCadRegraxRubrica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, StdCtrls, wwdblook, CmEventosCadastro, ImgList,
  MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc,
  Wwquery, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, uobjfolha, uAdmPrevFB,
  dBaseDados, uSistema, uDataBase;

type
  TFrmCadRegraxRubrica = class(TfrmCadMestreDetalheCS)
    LblRegraFolha: TLabel;
    dblkRegraFolha: TwwDBLookupCombo;
    qryDet: TwwQuery;
    LblRubricas: TLabel;
    qryRubricas: TwwQuery;
    qryRubricasIDPROVENTO: TFloatField;
    qryRubricasDESCRICAO: TStringField;
    qryIDREGRA: TFloatField;
    qryNOMEREGRA: TStringField;
    updDet: TUpdateSQL;
    MS1: TMontaSelect;
    EdtRubrica: TEdit;
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure dblkRegraFolhaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
  private
    { Private declarations }
    GuardaIdRegra   : Integer;
    GuardaIdRubrica : Integer;
    procedure AbreQryDet;
    procedure BuscaRubrica;
  public
    { Public declarations }
  end;

var
  FrmCadRegraxRubrica: TFrmCadRegraxRubrica;

implementation

{$R *.DFM}

procedure TFrmCadRegraxRubrica.FormShow(Sender: TObject);
Var
  sSql        : String;
  iGrupoRegra : Integer;

begin
  inherited;
  If SistemaFolha.FLGUSAREGRAXRUB = 1 Then
    iGrupoRegra := SistemaFolha.IDGRUPOREGRAFOLHA
  Else
    iGrupoRegra := 0;

  sSql := 'SELECT R.IDREGRA, R.NOMEREGRA FROM REGRA R, TIPOREGRA TR, GRUPOREGRA GR '+
          'WHERE R.IDTIPOREGRA = TR.IDTIPOREGRA AND TR.IDGRUPOREGRA = GR.IDGRUPOREGRA AND '+
          'GR.IDGRUPOREGRA = '+IntToStr(iGrupoRegra)+' ORDER BY UPPER(R.NOMEREGRA)';

  qry.SQL.Clear;
  qry.SQL.Add(sSql);
  qry.Open;

  If SistemaFolha.FlgUsaCodRubExt = 0 Then
    sSql := 'SELECT RR.IDREGRA, RR.IDRUBRICA, RR.IDRUBRICA AS CODPROVDESC, P.DESCRICAO '+
            'FROM REGRAXRUBRICA RR, PROVDESC P '+
            'WHERE RR.IDREGRA   = :PIDREGRA '+
             ' AND RR.IDRUBRICA = P.IDPROVENTO '
  Else
    sSql := 'SELECT RR.IDREGRA, RR.IDRUBRICA, P.CODPROVDESC, P.DESCRPROVDESC AS DESCRICAO '+
            'FROM REGRAXRUBRICA RR, PROVDESC P '+
            'WHERE RR.IDREGRA   = :PIDREGRA '+
             ' AND RR.IDRUBRICA = P.IDPROVENTO ';

  qryDet.Sql.Clear;
  qryDet.Sql.Add(sSql);

  qryDet.ParamByName('PIDREGRA').DataType := ftInteger; 

  sbtnInserir.Enabled := False;
  sbtnAlterar.Enabled := False;
  qryRubricas.Open;
end;

procedure TFrmCadRegraxRubrica.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
    dblkRegraFolha.Text := MontaSelect.ValoresChave[3];
    GuardaIdRegra       := StrToInt(MontaSelect.ValoresChave[0]);
    AbreQryDet;
  End;
end;

procedure TFrmCadRegraxRubrica.sbtnProcurarClick(Sender: TObject);
begin
  If SistemaFolha.IdGrupoRegraFolha <> 0 Then
    MontaSelect.Filtro.Add('GRUPOREGRA.IDGRUPOREGRA = '+inttostr(SistemaFolha.IDGRUPOREGRAFOLHA))
  Else
  Begin
    ShowMessage('É necessário marcar o parâmetro de rubricas associadas a regra.');
    sbtnProcurar.Down := False;
    Exit;
  End;
  inherited;
end;

procedure TFrmCadRegraxRubrica.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  AbreQryDet;
  If dblkRegraFolha.Text = '' Then
    sbtnInsDet.Enabled := False;
end;

procedure TFrmCadRegraxRubrica.dblkRegraFolhaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  GuardaIdRegra := StrToInt(dblkRegraFolha.LookupValue);
  AbreQryDet;

  If dblkRegraFolha.Text <> '' Then
  Begin
    sbtnInsDet.Enabled := True;
    If qryDet.RecordCount > 0 Then
    Begin
      sbtnExcluiDet.Enabled := True;
      sbtnAltDet.Enabled    := True;
    End;
  End;
end;

procedure TFrmCadRegraxRubrica.CmeDetalheCancel(Sender: TObject);
begin
  inherited;
  AbreQryDet;
end;

procedure TFrmCadRegraxRubrica.CmeDetalheAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnInserir.Enabled := False;
  sbtnAlterar.Enabled := True;
  sbtnApagar.Enabled  := False;
end;

procedure TFrmCadRegraxRubrica.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  BuscaRubrica;
end;

procedure TFrmCadRegraxRubrica.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  BuscaRubrica;
end;

procedure TFrmCadRegraxRubrica.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  if not Sistema.GravaLogOperacoes('Associação de Rubrica por Regra.') then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;
end;

procedure TFrmCadRegraxRubrica.AbreQryDet;
begin
  qryDet.Close;
  qryDet.ParamByName('PIDREGRA').AsInteger := GuardaIdRegra;
  qryDet.Open;
end;

procedure TFrmCadRegraxRubrica.BuscaRubrica;
begin
  MS1.Executar;
  If MS1.RetornouValor Then
  Begin
    If SistemaFolha.FlgUsaCodRubExt = 0 Then
    Begin
      GuardaIdRubrica := StrToInt(MS1.ValoresChave[0]);
      EdtRubrica.Text := MS1.ValoresChave[1];
    End
    Else
    Begin
      GuardaIdRubrica := StrToInt(MS1.ValoresChave[0]);
      EdtRubrica.Text := MS1.ValoresChave[3];
    End;
  End;
end;

procedure TFrmCadRegraxRubrica.CmeCadastroConfirma(Sender: TObject);
begin
  qry.CancelUpdates;
  inherited;
  AplicaAlteracoes([QryDet]);
end;

procedure TFrmCadRegraxRubrica.CmeDetalheConfirma(Sender: TObject);
begin
  If qryDet.State In [dsInsert, dsEdit] Then
  Begin
    qryDet.FieldByName('IDREGRA').AsInteger   := GuardaIdRegra;
    qryDet.FieldByName('IDRUBRICA').AsInteger := GuardaIdRubrica;
    If SistemaFolha.FlgUsaCodRubExt = 0 Then
    Begin
      qryDet.FieldByName('CODPROVDESC').AsInteger := GuardaIdRubrica;
      qryDet.FieldByName('DESCRICAO').AsString    := MS1.ValoresChave[1];
    End
    Else
    Begin
      qryDet.FieldByName('CODPROVDESC').AsString  := MS1.ValoresChave[2];
      qryDet.FieldByName('DESCRICAO').AsString    := MS1.ValoresChave[3];
    End;
    CmeDetalhe.RepetirInsert := False;
    inherited;
  End;
end;

end.

{==============================================================================|
| UNIT: FCADREGRAXRUBRICA                                                      |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   ASSOCIA AS RUBRICAS A UM GRUPO DE REGRA                                    |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 22/07/2002 A 22/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12i                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Alteração do MontaSelect de nome MS1 para trazer apenas as rubricas do   |
|   sistema Folha de Benefícios.                                               |
|                                                                              |
|------------------------------------------------------------------------------|

