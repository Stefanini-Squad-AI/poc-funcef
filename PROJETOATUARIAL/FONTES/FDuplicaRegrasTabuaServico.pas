{===============================================================================
Unit    :  FDuplicaRegrasTabuaServico
Form    :  FrmDuplicaRegrasTabuaServico

Autor   : Claudio Faria
Data    : 24/11/2006

Objetivo: Duplicar regras de ajustes no sistema

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}

unit FDuplicaRegrasTabuaServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, wwdblook, CMDBLookupCombo,
  DBTables, Wwquery, uMensErro;

type
  TFrmDuplicaRegrasTabuaServico = class(TFrmOkCancelar)
    grpDe: TGroupBox;
    grpPara: TGroupBox;
    ds: TwwDataSource;
    Label1: TLabel;
    Label2: TLabel;
    edRotina: TEdit;
    edVersao: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    dblkpVersao: TCMDBLookupCombo;
    qryVersaoTabuaServico: TwwQuery;
    qryRotinaCalculo: TwwQuery;
    qryVersaoTabuaServicoSQ_VERSAO_COMUTACAO: TFloatField;
    qryVersaoTabuaServicoDS_VERSAO_COMUTACAO: TStringField;
    qryRotinaCalculoCD_GRUPO_FORMULA: TFloatField;
    qryRotinaCalculoDS_GRUPO_FORMULA: TStringField;
    dblkpRotina: TCMDBLookupCombo;
    qryAux: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkpRotinaChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }

    function VerificaVersao(piTabua, piRotina : Integer ) : Boolean;

    procedure ExcluirVersao(piTabua, piRotina : Integer);

    procedure DuplicaVersao(piDe_Tabua, piDe_Rotina,
                            piPara_Tabua, piPara_Rotina : Integer);
  public
    { Public declarations }
    iTabua:Integer;
    iRotina:Integer;
    sTabua:String;
    sRotina:String;
  end;

var
  FrmDuplicaRegrasTabuaServico: TFrmDuplicaRegrasTabuaServico;

  Procedure DuplicaRegrasTabuaServico(piTabua : Integer; psTabua : String;
                                      piRotina : Integer; psRotina : String);

implementation

uses FCadRegrasTabuaServico, dBaseDados;

{$R *.DFM}

Procedure DuplicaRegrasTabuaServico(piTabua : Integer; psTabua : String;
                                    piRotina : Integer; psRotina : String);
Begin
  Application.CreateForm(TFrmDuplicaRegrasTabuaServico, FrmDuplicaRegrasTabuaServico);

  FrmDuplicaRegrasTabuaServico.edVersao.Text := psTabua;
  FrmDuplicaRegrasTabuaServico.iTabua        := piTabua;

  FrmDuplicaRegrasTabuaServico.edRotina.Text := psRotina;
  FrmDuplicaRegrasTabuaServico.iRotina       := piRotina;

  FrmDuplicaRegrasTabuaServico.Show;
End;

procedure TFrmDuplicaRegrasTabuaServico.FormShow(Sender: TObject);
begin
   inherited;

   If not qryRotinaCalculo.Active Then qryRotinaCalculo.Open;
end;

procedure TFrmDuplicaRegrasTabuaServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  qryRotinaCalculo.Close;
  qryVersaoTabuaServico.Close;
end;

procedure TFrmDuplicaRegrasTabuaServico.dblkpRotinaChange(
  Sender: TObject);
begin
  inherited;

  dblkpVersao.Enabled := False;
  QryVersaoTabuaServico.Close;
  QryVersaoTabuaServico.ParamByName('CD_GRUPO_FORMULA').AsString := qryRotinaCalculoCD_GRUPO_FORMULA.AsString;
  QryVersaoTabuaServico.Open;
  dblkpVersao.Enabled := True;                  
end;

procedure TFrmDuplicaRegrasTabuaServico.bbtnConfirmarClick(
  Sender: TObject);
begin
  inherited;

  If (edRotina.Text = dblkpRotina.Text) And
     (edVersao.Text = dblkpVersao.Text) Then
  Begin
     MsgDlg('Não é possivel duplicar as regras para a mesma versão','Atenção',mtinformation,[mbOk],0);
     Exit;
  End;

  If (dblkpRotina.Text = '') Or
     (dblkpVersao.Text = '') Then
  Begin
     MsgDlg('Não foi escolhido a versão de destino','Atenção',mtinformation,[mbOk],0);
     Exit;
  End;

  dtmBaseDados.dbBaseDados.StartTransaction;

  Try
    If VerificaVersao(qryVersaoTabuaServicoSQ_VERSAO_COMUTACAO.AsInteger,
                      qryRotinaCalculoCD_GRUPO_FORMULA.AsInteger ) Then
    Begin
      If (MsgDlg('Já existem regras cadastradas para essa versão, deseja realmente excluir as regras',
                     'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) Then
      Begin
         ExcluirVersao(qryVersaoTabuaServicoSQ_VERSAO_COMUTACAO.AsInteger,
                      qryRotinaCalculoCD_GRUPO_FORMULA.AsInteger);
      End
      Else
      Begin
        dtmBaseDados.dbBaseDados.Rollback;
        Exit;
      End;  
    End;

    DuplicaVersao(iTabua, iRotina,
                  qryVersaoTabuaServicoSQ_VERSAO_COMUTACAO.AsInteger,
                  qryRotinaCalculoCD_GRUPO_FORMULA.AsInteger);

    dtmBaseDados.dbBaseDados.Commit;

    MsgDlg('Duplicação realizada com sucesso','Atenção',mtinformation,[mbOk],0);

    frmCadRegrasTabuaServico.trvRegras.Items.Clear;
    frmCadRegrasTabuaServico.Atualiza_TreeView;

    FrmDuplicaRegrasTabuaServico.Close;
  Except
    dtmBaseDados.dbBaseDados.Rollback;
  End;
end;

function TFrmDuplicaRegrasTabuaServico.VerificaVersao(piTabua,
  piRotina: Integer): Boolean;
Var sSQL:String;
begin
  sSQL := ' SELECT COUNT(*) AS QUANTIDADE ' + #13 +
          ' FROM FI_REGRA_AJUSTE_COMUTACAO ' + #13 +
          ' WHERE SQ_VERSAO_COMUTACAO = ' + IntToStr(piTabua) + #13 +
          '   AND CD_GRUPO_FORMULA    = ' + IntToStr(piRotina);

  qryAux.Close;
  qryAux.SQL.Text := sSQL;
  qryAux.Open;

  Result := False;

  If qryAux.FieldByName('QUANTIDADE').AsInteger > 0 Then
    Result := True;
end;

procedure TFrmDuplicaRegrasTabuaServico.ExcluirVersao(piTabua,
  piRotina: Integer);
Var sSQL:String;
begin
  sSQL := ' DELETE FROM FI_REGRA_AJUSTE_COMUTACAO ' + #13 +
          ' WHERE SQ_VERSAO_COMUTACAO = ' + IntToStr(piTabua) + #13 +
          '   AND CD_GRUPO_FORMULA    = ' + IntToStr(piRotina);

  qryAux.Close;
  qryAux.SQL.Text := sSQL;
  qryAux.ExecSQL;
end;

procedure TFrmDuplicaRegrasTabuaServico.DuplicaVersao(piDe_Tabua,
  piDe_Rotina, piPara_Tabua, piPara_Rotina: Integer);
Var sSQL:String;
begin
  sSQL := ' INSERT INTO FI_REGRA_AJUSTE_COMUTACAO ' + #13 +
          '   ( SQ_VERSAO_COMUTACAO, CD_GRUPO_FORMULA, CD_FORMULA, ' + #13 +
          '     NR_ORDEM_FORMULA, CD_FORMULA_AJUSTE, IR_CONDICAO_AJUSTE, ' + #13 +
          '     NR_IDADE, TRGDTINCLUSAO, TRGUSERINCLUSAO ) ' + #13 +
          ' SELECT ' + #13 +
          '  ' + QuotedStr(IntToStr(piPara_Tabua)) + ' AS SQ_VERSAO_COMUTACAO, '
               + QuotedStr(IntToStr(piPara_Rotina)) + ' AS CD_GRUPO_FORMULA, ' + #13 +
          '  CD_FORMULA, NR_ORDEM_FORMULA, CD_FORMULA_AJUSTE, ' + #13 +
          '  IR_CONDICAO_AJUSTE, NR_IDADE, ' + #13 +
          '  SYSDATE AS TRGDTINCLUSAO, USER AS TRGUSERINCLUSAO ' + #13 +
          ' FROM FI_REGRA_AJUSTE_COMUTACAO ' + #13 +
          ' WHERE SQ_VERSAO_COMUTACAO = ' + IntToStr(piDe_Tabua) + #13 +
          '   AND CD_GRUPO_FORMULA    = ' + IntToStr(piDe_Rotina);

  qryAux.Close;
  qryAux.SQL.Text := sSQL;
  qryAux.ExecSQL;
end;

end.
