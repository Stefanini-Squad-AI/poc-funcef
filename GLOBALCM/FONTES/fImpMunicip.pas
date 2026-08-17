
unit fImpMunicip;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FImporta, OpenArqText, Db, DBTables, wwQuery, MAHlpBtn, StdCtrls,
  Buttons, TB97, ComCtrls, wwdblook, ExtCtrls, uSistema, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti;

type
  TfrmImpMunicip = class(TfrmImporta)
    dblkPais: TwwDBLookupCombo;
    Label2: TLabel;
    qryPais: Twwquery;
    procedure btnImportaClick(Sender: TObject);
  private
    { Private declarations }
    iProxCod: Integer;
  public
    { Public declarations }
  end;

var
  frmImpMunicip: TfrmImpMunicip;

implementation

uses DBaseDados,UAutorizacao,UMensErro,UDataBase;

{$R *.DFM}

procedure TfrmImpMunicip.btnImportaClick(Sender: TObject);
Var
  i,iMaxList              : Integer;
  sSQLImp,
  sSQLValues, 
  sSQLAUX,sUF             : String;
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

    iProxCod := LeUltRegistro(nil,'FERIADO'{ivlm});

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
    sUF :=  opDlgTxt.LeCampo('UF'{ivlm});
    sSQLAux := 'SELECT CODESTADO FROM ESTADO WHERE CODESTADO = '{ivlm} + sUF;
    qryAuxImp.SQL.Clear;
    qryAuxImp.SQL.Text := sSQLAUX;
    qryAuxImp.ExecSQL;
    if qryAuxImp.EOF Then Begin
      sSQLAUX := 'INSERT INTO ESTADO (CODESTADO,IDPAIS,NOMEESTADO) VALUES ('{ivlm};
      qryAuxImp.SQL.Clear;
      qryAuxImp.SQL.Text := sSQLAUX;
      qryAuxImp.ExecSQL;
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
