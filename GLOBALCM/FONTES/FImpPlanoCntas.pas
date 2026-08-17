unit FImpPlanoCntas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FImporta, OpenArqText, Db, DBTables, wwQuery, MAHlpBtn, StdCtrls,
  Buttons, TB97, ComCtrls, wwdblook, ExtCtrls, uSistema,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmImpPlanoCntas = class(TfrmImporta)
    Label2: TLabel;
    qryPlano: Twwquery;
    edPlano: TEdit;
    Label3: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnImportaClick(Sender: TObject);
    Procedure OutrosSERPROS(Var sSQLImp,sSQLValues : String);
  private
    { Private declarations }
   sMascara, sMascPict : String;
   lNivel      : Array [0..20] of Integer;
   iSoma, ind          : Integer;
   sPai   : String;
   public
    { Public declarations }
  end;

var
  frmImpPlanoCntas: TfrmImpPlanoCntas;

implementation

{$R *.DFM}

Uses UAutorizacao, UMensErro, UPlanoContas, DBaseDados;

procedure TfrmImpPlanoCntas.FormActivate(Sender: TObject);
begin
  inherited;
  qryPlano.SQL.Clear;
  qryPlano.SQL.Text := 'SELECT PARAM.PLANO,PLN.DESCPLANO,PLN.MASCARA FROM PARAMCONTAB PARAM,PLANO PLN WHERE IDPESSOA = '{ivlm} + InttoStr(Sistema.IdEmpresa) + ' AND PLN.PLANO = PARAM.PLANO'{ivlm};
  qryPlano.Open;
  edPlano.Text := qryPlano.FieldByName('DESCPLANO'{ivlm}).AsString;
  sMascara := qryPlano.FieldByName('MASCARA'{ivlm}).AsString;
end;


procedure TfrmImpPlanoCntas.btnImportaClick(Sender: TObject);
Var
  i,iMaxList,iZeros,iGrau,
  iCodReduz               : Integer;
  sSQLImp,
  sSQLValues, sPlaconta   : String;
  qryAuxImp               : TQuery;
  lChecked,lProblema      : Boolean;
begin
  inherited;
  lProblema := false;
  if not VerificaMascara(sMascara,sMascPict,lNivel,iSoma,ind) Then Begin
     MsgDlg('Máscara do Plano de Contas Inconsistente',LerMensagem(2),mtWarning,[mbOk],0);
     exit;
  end;
  lChecked   := False;
  sSQLImp    := '';
  prgbrImportar.Visible := true;
  prgbrImportar.Max     := mmTxt.Lines.Count;
  if not opDlgTxt.AbreArquivo('L'{ivlm}) then Begin
     MsgDlg('Arquivo Texto com formato incompatível',LerMensagem(2),mtWarning,[mbOk],0);
     exit;
  end;
  qryAuxImp := TQuery.Create( Application );
  qryAuxImp.DataBaseName := 'BaseDados'{ivlm};
  dtmBaseDados.dbBaseDados.StartTransaction;
  if rdgrpContas.ItemIndex = 0 Then Begin
     Try
       qryAuxImp.SQL.Text := 'DELETE FROM '{ivlm} + sEntidade + ' WHERE PLANO = '{ivlm} + InttoStr(qryPlano.FieldByName('PLANO'{ivlm}).AsInteger);
       qryAuxImp.Open;
     Except
       MsgDlg('Não é possível Sobrescrever este Plano de Contas',LerMensagem(2),mtWarning,[mbOk],0);
       rdgrpContas.SetFocus;
       qryAuxImp.Free;
       exit;
     end;
  end;

  for i:= 1 to prgbrImportar.Max Do Begin
    sSQLImp    := 'INSERT INTO '{ivlm} + sEntidade + ' ('{ivlm};
    sSQLValues := ' VALUES('{ivlm};
    prgbrImportar.Stepit;
    opDlgTxt.LeLinha;
    if opDlgTxt.LeCampo('SEQUENCIA'{ivlm}) = '01'{ivlm} Then Begin
       for iMaxList := 0 to lvCampos.Items.count - 1 Do Begin
           if lvCampos.Items[iMaxList].Checked  = true Then Begin
              sSQLImp    := sSQLImp + lvCampos.Items[iMaxList].SubItems[0];
              if lvCampos.Items[iMaxList].SubItems[0] = 'PLACONTA'{ivlm} Then
                 Begin
                   sPlaconta := OpDlgTxt.LeCampo(lvCampos.Items[iMaxList].SubItems[0]);
                   for iZeros := 10 Downto 1 Do Begin
                     if copy(sPlaconta,iZeros,1) <> '0'{ivlm} Then Begin
                        sPlaconta  := Copy(sPlaconta,1,iZeros);
                        Break;
                     end;
                   end;
                   iGrau := CalcGrau(sPlaconta,lNivel,ind,sPai);
                   While igrau = 0 Do Begin // problema com a retirada de zeros a direita da conta
                      sPlaconta := sPlaConta + '0'{ivlm};
                      iGrau := CalcGrau(sPlaconta,lNivel,ind,sPai);
                   end;
                   sSQLValues := sSQLValues + '''' + sPlaconta + '''';
                   sSQLImp := sSQLImp + ', PLAGRAU'{ivlm};
                   sSQLValues := sSQLValues + ','{ivlm} + InttoStr(iGrau);

                   //   Atribuição do Grupo (Ativo, Passivo, Receita e Despesa)
                   //  e Código Reduzido
                   qryAuxImp.Close;
                   qryAuxImp.SQL.Clear;
                   qryAuxImp.SQL.Text := 'SELECT  PACREDUZA,PACREDUZP,PACREDUZR,PACREDUZD,PACREDUZO FROM PARAMCONTAB WHERE IDPESSOA = '{ivlm} + InttoStr(Sistema.IdEmpresa);
                   qryAuxImp.Open;
                   sSQLImp := sSQLImp + ', PLAGRUPO'{ivlm};
                   if copy(sPlaconta,1,1) = '1'{ivlm} Then Begin
                      sSQLValues := sSQLValues + ',''A'''{ivlm};
                      iCodReduz := qryAuxImp.FieldByName('PACREDUZA'{ivlm}).AsInteger;
                      qryAuxImp.Close;
                      qryAuxImp.SQL.Clear;
                      qryAuxImp.SQL.Text := 'UPDATE PARAMCONTAB SET PACREDUZA = '{ivlm}+ inttoStr(iCodReduz + 1) + ' WHERE IDPESSOA = '{ivlm}+ InttoStr(Sistema.IdEmpresa);
                   end
                   else if copy(sPlaconta,1,1) = '2'{ivlm} Then Begin
                      sSQLValues := sSQLValues + ',''P'''{ivlm};
                      iCodReduz := qryAuxImp.FieldByName('PACREDUZP'{ivlm}).AsInteger;
                      qryAuxImp.Close;
                      qryAuxImp.SQL.Clear;
                      qryAuxImp.SQL.Text := 'UPDATE PARAMCONTAB SET PACREDUZP = '{ivlm}+ inttoStr(iCodReduz + 1) + ' WHERE IDPESSOA = '{ivlm}+ InttoStr(Sistema.IdEmpresa);
                   end
                   else if (copy(sPlaconta,1,2) = '31'{ivlm}) or (copy(sPlaconta,1,2) = '41'{ivlm}) Then Begin
                      sSQLValues := sSQLValues + ',''R'''{ivlm};
                      iCodReduz := qryAuxImp.FieldByName('PACREDUZR'{ivlm}).AsInteger;
                      qryAuxImp.Close;
                      qryAuxImp.SQL.Clear;
                      qryAuxImp.SQL.Text := 'UPDATE PARAMCONTAB SET PACREDUZR = '{ivlm}+ inttoStr(iCodReduz + 1) + ' WHERE IDPESSOA = '{ivlm}+ InttoStr(Sistema.IdEmpresa);
                   end
                   else if (copy(sPlaconta,1,2) = '32'{ivlm}) or (copy(sPlaconta,1,2) = '42'{ivlm}) Then Begin
                      sSQLValues := sSQLValues + ',''D'''{ivlm};
                      iCodReduz := qryAuxImp.FieldByName('PACREDUZD'{ivlm}).AsInteger;
                      qryAuxImp.Close;
                      qryAuxImp.SQL.Clear;
                      qryAuxImp.SQL.Text := 'UPDATE PARAMCONTAB SET PACREDUZD = '{ivlm}+ inttoStr(iCodReduz + 1) + ' WHERE IDPESSOA = '{ivlm}+ InttoStr(Sistema.IdEmpresa);
                   end
                   else Begin
                      sSQLValues := sSQLValues + ',''O'''{ivlm};
                      iCodReduz := qryAuxImp.FieldByName('PACREDUZO'{ivlm}).AsInteger;
                      qryAuxImp.Close;
                      qryAuxImp.SQL.Clear;
                      qryAuxImp.SQL.Text := 'UPDATE PARAMCONTAB SET PACREDUZO = '{ivlm}+ inttoStr(iCodReduz + 1) + ' WHERE IDPESSOA = '{ivlm}+ InttoStr(Sistema.IdEmpresa);

                   end;
                   qryAuxImp.ExecSQL;
                   sSQLImp := sSQLImp + ', PLAREDUZ'{ivlm};
                   sSQLValues := sSQLValues + ','{ivlm} + InttoStr(iCodReduz);

                 end
              else Begin
                 if ((Trim(lvCampos.Items[iMaxList].SubItems[1]) = 'STRING'{ivlm}) OR (Trim(lvCampos.Items[iMaxList].SubItems[1]) = 'Alfanumérico'{ivlm})) Then
                    sSQLValues := sSQLValues + '''' + OpDlgTxt.LeCampo(lvCampos.Items[iMaxList].SubItems[0]) + ''''
                 else
                    sSQLValues := sSQLValues + OpDlgTxt.LeCampo(lvCampos.Items[iMaxList].SubItems[0]);
              end;
              lChecked := True;
              if iMaxList <> lvCampos.Items.count - 1 Then
                 sSQLImp    := sSQLImp    + ', '{ivlm};
                 sSQLValues := sSQLValues + ', '{ivlm};
           end;
       end;
       if not lChecked Then Begin
          MsgDlg('Escolha ao menos um campo para Importar',LerMensagem(2),mtWarning,[mbOk],0);
          rdgrpContas.SetFocus;
          exit;
       end;
       OutrosSERPROS(sSQLImp,sSQLValues);
       sSQLImp := sSQLImp + ')'{ivlm} + sSQLValues + ')'{ivlm};

       qryAuxImp.SQL.Clear;
       qryAuxImp.SQL.Text := sSQLImp;
       try
         qryAuxImp.ExecSQL;
       Except
         MsgDlg('Operação não concluída - Verifique',LerMensagem(2),mtError,[mbOk],0);
         dtmBaseDados.dbBaseDados.RollBack;
         lProblema := true;
         Break;
       end

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

Procedure TfrmImpPlanoCntas.OutrosSERPROS(Var sSQLImp,sSQLValues : String);
Var
   sCampo : String;
Begin
   sCampo := OpDlgTxt.LeCampo('ID_SALDO'{ivlm});
   sSQLImp := sSQLImp + ',PLATIPO'{ivlm};
   if sCampo = ' '{ivlm} Then
      sSQLValues := sSQLValues + '''S'''{ivlm}
   else
      sSQLValues := sSQLValues + '''A'''{ivlm};
   sSQLImp    := sSQLImp + ', PLANATUREZA'{ivlm};
   if sCampo = '+'{ivlm} Then
      sSQLValues := sSQLValues + ',''D'''{ivlm}
   else
      sSQLValues := sSQLValues + ',''C'''{ivlm};
   // Campos Obrigatorios nao preenchidos anteriormente
   sSQLImp := sSQLImp + ', PLANO,PLATIPCONVGERENCIAL,PLATIPCONVGEREN1,PLATIPCONVGEREN2,PLATIPCONVOFICIAL,PLAALTERA,PLAINATIVA,IDUSUARIOINCLUSAO'{ivlm};
   sSQLValues := sSQLValues + ','{ivlm} + InttoStr(qryPlano.FieldByName('PLANO'{ivlm}).AsInteger);
   sSQLValues := sSQLValues + ',''N'',''N'',''N'',''N'',''S'',''A'''{ivlm};
   sSQLValues := sSQLValues + ','{ivlm}+ InttoStr(Sistema.idUsuario);



End;
end.
