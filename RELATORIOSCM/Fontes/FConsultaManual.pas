{ --------------------------------------------------------------------------------------------------
Rotina    : MontaSelect
Data      : 08/03/2004
Autor     : Marcheti
Pendencia : 15228
Descrição : Ajuste no campo descricao
---------------------------------------------------------------------------------------------------}
(*******************************************************************************
Histórico

04/12/98
 Sustituição do TbDataView Pelo Qry
 Alteração para o novo modelo de dados - Implementações diversas
*******************************************************************************)

unit FConsultaManual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCs, StdCtrls, DBCtrls, Mask, wwdbedit, Db, DBTables, Wwtable,
  cmseldlg, wwidlg, Wwdatsrc, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Wwquery, MontaSelect, IvDictio, IvMulti, IvEMulti, ComCtrls,
  CmEventosCadastro, ImgList;

type
  TFrmConsultaManual = class(TfrmCadastroCS)
    Nome: TLabel;
    Label1: TLabel;
    EditNome: TwwDBEdit;
    Label2: TLabel;
    MemDesc: TDBMemo;
    BtnDDic: TToolbarButton97;
    qryDataView: TwwQuery;
    qryIDDATAVIEW: TFloatField;
    qryNAME: TStringField;
    qryCLASSNAME: TStringField;
    qryTEMPLATE: TBlobField;
    qryDESCRIPTION: TMemoField;
    qryORIGEMCMDV: TFloatField;
    ReSql: TRichEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure BtnDDicClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TStatus = (stIdle, stSelect, stFrom, stWhere, stOrder);
  TTipoWhere = (twWhere, twParentL, twParentR, twOperador, twClausula);

var
  FrmConsultaManual: TFrmConsultaManual;

implementation

uses DbaseDados, uModulo, uMensErro, uSIstema, uDataBase, FDesenhoOutLookMT,
     uVerificaSQL, uCmTypes;

{$R *.DFM}

Procedure TFrmConsultaManual.CmeCadastroConfirma(Sender: TObject);
Var
  iOldId, iOldDv: Integer;
  sDescricao: String;
Begin
  iOldId := 0;
  iOldDv := 0;

  If CmeCadastro.Operacao In [OpInserir,OpAlterar] Then
  Begin
     iOldId     := QryIDDATAVIEW.AsInteger;
     iOldDv     := qryORIGEMCMDV.AsInteger;
     sDescricao := qryDESCRIPTION.AsString;
  End;

  inherited;

  If iOldId <> 0 Then
  Begin
     qryDataView.Close;
     If Not qryDataView.Prepared Then qryDataView.Prepare;
     qryDataView.Params[0].AsInteger := iOldId;
     qryDataView.Params[1].AsInteger := iOldDv;
     qryDataView.Open;
     qryDataView.Edit;
     qryDataView.FieldByName('DESCRIPTION').AsString := sDescricao;
     ReSql.PlainText := True;
     qryDataView.FieldByName('TEMPLATE').AsString    := ReSql.Lines.Text;
     ReSql.PlainText := False;
     qryDataView.Post;
     qryDataView.Close;
  End;

End;

Procedure TFrmConsultaManual.CmeCadastroInsert(Sender: TObject);
Begin
    inherited;
    ReSql.Lines.Clear;    
    QryCLASSNAME.AsString := 'TDvQryManual';
    QryIDDATAVIEW.AsInteger := LeUltRegistro(nil,'DATAVIEW');
    qryORIGEMCMDV.AsInteger := 0;
    EditNome.SetFocus;
End;

procedure TFrmConsultaManual.CmeCadastroFind(Sender: TObject);
begin
  Inherited;

  If MontaSelect.RetornouValor Then
  Begin
     Qry.Close;
     If Not Qry.Prepared Then Qry.Prepare;
     Qry.Params[0].AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
     Qry.Params[1].AsInteger := StrToInt(MontaSelect.ValoresChave[1]);
     Qry.Open;

     qryDataView.Close;
     If Not qryDataView.Prepared Then qryDataView.Prepare;
     qryDataView.Params[0].AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
     qryDataView.Params[1].AsInteger := StrToInt(MontaSelect.ValoresChave[1]);
     qryDataView.Open;
     ReSql.Lines.Text := qryDataView.FieldByName('TEMPLATE').AsString;
  End;
end;

procedure TFrmConsultaManual.CmeCadastroEdit(Sender: TObject);
Begin
    inherited;
    EditNome.SetFocus;
End;

procedure TFrmConsultaManual.bbtnConfirmarClick(Sender: TObject);
Var
  LstFields :TStringList;
begin
   If QryNAME.IsNull Then
   Begin
       MsgDlg('Indicar nome da consulta','Atenção',MtInformation,[MbOk],0);
       EditNome.SetFocus;
       Exit;
   End;

   LstFields := TStringList.Create;
   
   Try
      If Not VerificaSql( ReSql.Lines ) Then Begin
         MsgDlg( 'Você não tem permissão de acesso a uma ou mais tabelas do Sql.',
                 'Consulta Manual', MtInformation, [MbOk], 0 );
         Exit;
      End;

      With DtmBaseDados.Qry Do
      Begin
           Close;
           ReSql.PlainText := True;
           Sql.Text := ReSql.Lines.Text;
           ReSql.PlainText := False;
           GetFieldNames(LstFields);
      End;
   Except
      On E:Exception Do
      Begin
         MsgDlg('Consulta incorreta: ' + (#13 + #10) + E.Message,'Atenção',MtInformation,[MbOk],0);
         LstFields.Free;
         Exit;
      End;
   End;
   LstFields.Free;

   inherited;
end;

procedure TFrmConsultaManual.BtnDDicClick(Sender: TObject);
begin
  inherited;
  FrmDesenhoOutLookMT.CmSql.DataDic.Executar;
  BtnDDic.Down := False;
end;

procedure TFrmConsultaManual.FormCreate(Sender: TObject);
begin
  inherited;
  If Not Qry.Prepared Then Qry.Prepare;
  If Not Qry.Active Then Qry.Open;
  If Not qryDataView.Prepared Then qryDataView.Prepare;
end;

procedure TFrmConsultaManual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  If Qry.Active Then Qry.Close;
  If Qry.Prepared Then Qry.UnPrepare;
  If qryDataView.Active Then qryDataView.Close;
  If qryDataView.Prepared Then qryDataView.UnPrepare;
  ModalResult := MrCancel;
  inherited;
end;

end.


