unit fImpSubConta;

interface

uses ivDictio,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FImporta, OpenArqText, Db, DBTables, CMwwQuery, MAHlpBtn, StdCtrls, uSistema,
  Buttons, TB97, ComCtrls, wwdblook, ExtCtrls, TB97Tlbr, Wwquery, IvMulti,
  IvEMulti;

type
  TfrmImpSubConta = class(TfrmImporta)
    procedure btnImportaClick(Sender: TObject);
  private
    { Private declarations }
    iProxCod: Integer;
  public
    { Public declarations }
  end;

var
  frmImpSubConta: TfrmImpSubConta;

implementation

uses DBaseDados,UAutorizacao,UMensErro;

{$R *.DFM}

procedure TfrmImpSubConta.btnImportaClick(Sender: TObject);
Var
  i,iMaxList              : Integer;
  sSQLImp,
  sSQLValues              : String;
  qryAuxImp               : TQuery;
  lChecked,lProblema      : Boolean;
begin
  inherited;
  lProblema             := false;
  prgbrImportar.Visible := true;
  prgbrImportar.Max     := mmTxt.Lines.Count;
  mmTxt.Clear;
  mmTxt.Lines.Add(Translate('Contas Auxiliares não Importadas'));
  lChecked   := False;
  sSQLImp    := '';
  if not opDlgTxt.AbreArquivo('L'{ivlm}) then Begin
     MsgDlg('Arquivo Texto com formato incompatível',LerMensagem(2),mtWarning,[mbOk],0);
     exit;
  end;
  qryAuxImp := TQuery.Create( Application );
  qryAuxImp.DataBaseName := 'BaseDados'{ivlm};
  dtmBaseDados.dbBaseDados.StartTransaction;
  if rdgrpContas.ItemIndex = 0 Then Begin
     Try
       qryAuxImp.SQL.Text := 'DELETE FROM '{ivlm} + sEntidade + ' WHERE IDPESSOA = '{ivlm}+ InttoStr(Sistema.IdEmpresa);
       qryAuxImp.Open;
     Except
       MsgDlg('Não é possível Sobrescrever este arquivo de Subcontas',LerMensagem(2),mtWarning,[mbOk],0);
       rdgrpContas.SetFocus;
       qryAuxImp.Close;
       qryAuxImp.Free;
       exit;
     end;
  end;

  for i:= 1 to prgbrImportar.Max Do Begin
    qryAuxImp.Close;
    qryAuxImp.SQL.Clear;
    qryAuxImp.SQL.Text := 'SELECT SEQSUBCONTA.NEXTVAL  AS proximo FROM DUAL'{ivlm};
    try
      qryAuxImp.Open;
    Except
      MsgDlg('Problema na geração de sequência de importação',LerMensagem(2),mtWarning,[mbOk],0);
      dtmBaseDados.dbBaseDados.RollBack;
      qryAuxImp.Close;
      qryAuxImp.Free;
      exit;
    end;
    iProxCod := qryAuxImp.FieldByName( 'Proximo'{ivlm} ).AsInteger;

    sSQLImp    := 'INSERT INTO '{ivlm} + sEntidade + ' ('{ivlm};
    sSQLValues := ' VALUES('{ivlm};
    prgbrImportar.Stepit;
    opDlgTxt.LeLinha;
    for iMaxList := 0 to lvCampos.Items.count - 1 Do Begin
        if lvCampos.Items[iMaxList].Checked  = true Then Begin
           sSQLImp    := sSQLImp + lvCampos.Items[iMaxList].SubItems[0];
           if Trim(lvCampos.Items[iMaxList].SubItems[1]) = 'STRING'{ivlm} Then
             sSQLValues := sSQLValues + '''' + OpDlgTxt.LeCampo(lvCampos.Items[iMaxList].SubItems[0]) + ''''
           else
             sSQLValues := sSQLValues + OpDlgTxt.LeCampo(lvCampos.Items[iMaxList].SubItems[0]);
        end;
        lChecked := True;
        if iMaxList <> lvCampos.Items.count - 1 Then Begin
           sSQLImp    := sSQLImp    + ', '{ivlm};
           sSQLValues := sSQLValues + ', '{ivlm};
        end;
    end;
    if not lChecked Then Begin
       MsgDlg('Escolha ao menos um campo para Importar',LerMensagem(2),mtWarning,[mbOk],0);
       rdgrpContas.SetFocus;
       qryAuxImp.Close;
       qryAuxImp.Free;
       exit;
    end;

    sSQLImp    := sSQLImp    + ',IDPESSOA, CODSUBCONTA'{ivlm};
    sSQLValues := sSQLValues + ','{ivlm} + InttoStr(Sistema.IdEmpresa);
    sSQLValues := sSQLValues + ','{ivlm} + InttoStr(iProxCod);
    sSQLImp := sSQLImp + ')'{ivlm} + sSQLValues + ')'{ivlm};
    qryAuxImp.SQL.Clear;
    qryAuxImp.SQL.Text := sSQLImp;
    try
      qryAuxImp.ExecSQL;
    Except
      MsgDlg('Operação não concluída - Verifique => '+ sSQLImp,LerMensagem(2),mtError,[mbOk],0);
      dtmBaseDados.dbBaseDados.RollBack;
      lProblema := true;
      Break;
    end;
  end;
  prgbrImportar.Visible := false;
  if not lProblema Then
  try
    dtmBaseDados.dbBaseDados.Commit;
    MsgDlg('Operação concluída com sucesso',LerMensagem(2),mtWarning,[mbOk],0);
  except
    MsgDlg('Operação não concluída - Verifique',LerMensagem(2),mtError,[mbOk],0);
    dtmBaseDados.dbBaseDados.RollBack;
  end;
  qryAuxImp.Close;
  qryAuxImp.Free;
end;

end.
