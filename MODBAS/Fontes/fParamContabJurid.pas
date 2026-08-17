unit fParamContabJurid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  checklst, Spin, wwdblook, Db, Wwdatsrc, DBTables, Wwquery, Gauges;

type
  TfrmParamContabJurid = class(TfrmOkCancelar)
    gbxTipoPag: TGroupBox;
    gbxMesAnoRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxMotivo: TGroupBox;
    qryTipoOper: TwwQuery;
    dblcTipOper: TwwDBLookupCombo;
    qryContabJurid: TwwQuery;
    qryAuxContab: TwwQuery;
    qryAux2: TwwQuery;
    pnlProgresso: TPanel;
    gagProgresso: TGauge;
    qryContas: TwwQuery;
    rgConsolida: TRadioGroup;
    cbx1: TCheckBox;
    cbx2: TCheckBox;
    cbx3: TCheckBox;
    cbx4: TCheckBox;
    cbx5: TCheckBox;
    cbx6: TCheckBox;
    cbx7: TCheckBox;
    cbx0: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    iIDPatro, iIDPlanoPrev: Integer;
  end;

var
  frmParamContabJurid: TfrmParamContabJurid;
  NomeTabela, DataRef, sMes, sMensagem, sMascara: string;
  I, liExercicio, liPeriodo, iEmpresa: integer;
  bTestaConta: boolean;

implementation

uses uSistema, uMensErro, dBaseDados, uFuncoesUteisRH, uLancContab;

{$R *.DFM}

procedure TfrmParamContabJurid.FormCreate(Sender: TObject);
begin
  inherited;
  qryTipoOper.Open;

  sMes             := Copy(IncData (DateToStr(Date),0,-1,0),4,2);
  cmbMes.ItemIndex := StrToInt(sMes) - 1;
  speAno.Text      := Copy(IncData (DateToStr(Date),0,-1,0),7,4);

  with (qryAuxContab) do
  begin
    SQL.Clear;
    SQL.Add ('SELECT IDPATRO, IDPLANOPREV FROM PARALMOX');
    Open;
    iIDPatro     := IFF(Sistema.UsaPlanoPatro, FieldByName('IDPATRO').asInteger, -1);
    iIDPlanoPrev := IFF(Sistema.UsaPlanoPatro, FieldByName('IDPLANOPREV').asInteger, -1);
    Close;
  end;
  qryAuxContab.SQL.Clear;
end;

procedure TfrmParamContabJurid.bbtnConfirmarClick(Sender: TObject);
var
  planilha, Pln: LongInt;
  K, I, iProvento, iUltPessJur: integer;
  sSql, sCentCust, sCodSubContaDeb, sCodSubContaCre, sMesRef: string;
  bTemContaCC, bTemAlguma, bBookMark, bConsolida: boolean;
  SvNum: TBookMark;
begin
  inherited;
  bConsolida := (rgConsolida.ItemIndex = 0);
  iUltPessJur := -1;
  if (dblcTipOper.Text = '') then
  begin
    MsgDlg ('Tipo de Operação não preenchido.','Aviso', mtInformation,[mbOk,mbHelp],0);
    dblcTipOper.SetFocus;
    exit;
  end;

  if (not cbx0.Checked) and (not cbx1.Checked)  and
     (not cbx2.Checked) and (not cbx3.Checked)  and
     (not cbx4.Checked) and (not cbx5.Checked)  and
     (not cbx6.Checked) and (not cbx7.Checked) then
  begin
    MsgDlg('Assinale Ao Menos Um Tipo de Matéria', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    cbx0.SetFocus;
    exit;
  end;

  sMes := IntToStr(cmbMes.ItemIndex + 1);
  if cmbMes.ItemIndex < 9 then sMes := '0' + sMes;
  DataRef := DateToStr(TrazUltDiaData(StrToDate('01/' + sMes + '/' + speAno.Text)));
  sMesRef := speAno.Text + '/' + sMes;
  sMensagem   := '';
  sMascara    := '';
  bTestaConta := True;  
  iEmpresa    := Sistema.idEmpresa;

  if not(TESTAPERIODO(True,'BaseDados',DataRef,
         IntToStr(Sistema.idModulo),liExercicio,liPeriodo,iEmpresa, sMensagem) = 0) then
  begin
    cmbMes.SetFocus;
    exit;
  end;

  with (qryContabJurid.SQL) do
  begin
    Clear;
    Add ('SELECT ');
    Add ('  PROC.INDMATERIA,');
    Add ('  H.CODTIPOOBJETO, sum(H.VALORRECL * PERCPROB / 100) AS TOTALPROVAVEL ');
    Add ('FROM');
    Add ('  PROCESSOTRAB PROC, OBJPROCTRAB H ');
    // ------------------------------------------------------------------------------- //
    Add ('WHERE');
    Add ('  (NVL(H.DATAINICIO,PROC.DATANOTIF) <= TO_DATE(' + QuotedStr(DataRef) + ',''DD/MM/YYYY'')) AND');
    Add ('  (PROC.DATAEFETENC IS NULL OR NVL(H.DATAFINAL,PROC.DATAEFETENC) > TO_DATE(' + QuotedStr(DataRef) + ',''DD/MM/YYYY'')) AND');
    // ------------------------------------------------------------------------------- //
    if not cbx1.Checked then
        Add (' (PROC.INDMATERIA <> 1 ) AND');
    if not cbx2.Checked then
        Add (' (PROC.INDMATERIA <> 2 ) AND');
    if not cbx3.Checked then
        Add (' (PROC.INDMATERIA <> 3 ) AND');
    if not cbx4.Checked then
        Add (' (PROC.INDMATERIA <> 4 ) AND');
    if not cbx5.Checked then
        Add (' (PROC.INDMATERIA <> 5 ) AND');
    if not cbx6.Checked then
        Add (' (PROC.INDMATERIA <> 6 ) AND');
    if not cbx7.Checked then
        Add (' (PROC.INDMATERIA <> 7 ) AND');

    Add ('  (H.NUMPROCTRAB           = PROC.NUMPROCTRAB)  ');
    Add ('GROUP BY');
    Add ('   PROC.INDMATERIA, H.CODTIPOOBJETO');

    savetofile ('c:\qry.txt');
  end;

  // Pega Máscara do Plano de Contas
  qryAux2.Close;
  qryAux2.SQL.Clear;
  qryAux2.SQL.Add('SELECT PL.MASCARA, PR.PLANO FROM PLANO PL, PARAMCONTAB PR ');
  qryAux2.SQL.Add('WHERE PR.PLANO = PL.PLANO AND PR.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
  qryAux2.Open;
  sMascara  := qryAux2.Fields[0].AsString;
  qryAux2.Close;


  with (qryContabJurid) do
  begin
    Open;

    pnlProgresso.Visible := True;
    pnlProgresso.BringToFront;
    pnlProgresso.Update;
    gagProgresso.MaxValue := RecordCount;
    gagProgresso.Progress := 0;

    dtmBaseDados.dbBaseDados.StartTransaction;
    while not eof do
    begin
       gagProgresso.Progress := gagProgresso.Progress + 1;
       iProvento:=FieldByName('CODTIPOOBJETO').AsInteger;
       sSql:='SELECT C.IDPLANO1,C.IDPLANO2,C.CONTADEBITO, '+
             'C.CONTACREDITO,C.INDMATERIA,'+
             'TP.DESCRICAO '+
             ' FROM CONTABJURID C, TIPOOBJPROCTRAB TP'+
             ' WHERE (C.CODTIPOOBJETO = '+IntToStr(iProvento)+')'+
             ' AND (C.INDMATERIA = ' + FieldByName('INDMATERIA').AsString + ')'+
             ' AND (C.CODTIPOOBJETO = TP.CODTIPOOBJETO) ';

       qryAuxContab.Close;
       qryAuxContab.SQL.Text:=sSql;
       qryAuxContab.Open;
       if qryAuxContab.IsEmpty then begin
          sSql:='SELECT C.IDPLANO1,C.IDPLANO2,C.CONTADEBITO, '+
                'C.CONTACREDITO,C.INDMATERIA,'+
                'TP.DESCRICAO '+
                ' FROM CONTABJURID C, TIPOOBJPROCTRAB TP'+
                ' WHERE (C.CODTIPOOBJETO = '+IntToStr(iProvento)+')'+
                ' AND (C.INDMATERIA = 0)'+
                ' AND (C.CODTIPOOBJETO = TP.CODTIPOOBJETO) ';

          qryAuxContab.Close;
          qryAuxContab.SQL.Text:=sSql;
          qryAuxContab.Open;
       end;


       if not qryAuxContab.IsEmpty then begin
          // Contas a Pagar
         { iUnidNegoc   := qryAuxContab.FieldByName('UNIDNEGOC').AsInteger;
          sCodCentroRespon := qryAuxContab.FieldByName('CODCENTRORESPON').AsString;
          sCodTipRecDes    := qryAuxContab.FieldByName('CODTIPRECDES').AsString;
          if qryAuxContab.FieldByName('FLGDESCONTO').AsInteger = 0 then
                 sDebCre := 'D'
             else
                 sDebCre := 'C';
          ContaLiquido := ''; // Parametrizar Conta Contábil do Líquido
          dUltValorProvento := ValProv;
          if (FieldByName('CodRubCLT').AsString = '40599') or
             (FieldByName('CodRubCLT').AsString = '40999') then
             dUltValorLiquido := dUltValorProvento;
          iPortFormaParticip := 0; //(CASO TENHA OUTRAS FORMAS)qryPrinc.FieldByName('CODPORTFORMA').asinteger;
         }
          // Contabilidade
          sCodSubContaDeb:='';
          sCodSubContaCre:='';

          bBookMark := False;
          qryAuxContab.First;
          bTemAlguma  := False;
          while not qryAuxContab.Eof do
          begin
            {sSql:='SELECT PLACCUST '+
                  ' FROM PLANOCONTA'+
                  ' WHERE (PLANO  = '+qryAuxContab.FieldByName('IDPLANO1').asString+')'+
                  ' AND (PLACONTA = '+qryAuxContab.FieldByName('CONTADEBITO').asString)+')';
            qryContas.Close;
            qryContas.SQL.Text:=sSql;
            qryContas.Open;}
            bTemContaCC := False;
            if (Trim(qryAuxContab.FieldByName('CONTADEBITO').asString) <> '') then
            begin
               bTemAlguma  := True;
               bTemContaCC := (qryAuxContab.FieldByName('INDMATERIA').asInteger =
                               FieldByName('INDMATERIA').asInteger);
               if bTemContaCC then begin
                  bBookMark := False;
                  break;
               end
               else begin
                  SvNum := qryAuxContab.GetBookmark;
                  bBookMark := qryAuxContab.FieldByName('INDMATERIA').asInteger = 0;
               end;
            end;
            qryAuxContab.Next;
          end;

          if bBookMark then qryAuxContab.GotoBookmark(SvNum);

          if (bBookMark) or (bTemContaCC) then
          begin
              //if not qryAuxContab.FieldByName('CODSUBDEBITO').isNull then begin
              //   sCodSubContaDeb:=qryAuxContab.FieldByName('CODSUBDEBITO').asString;
              //end;
              try
                Planilha:=LANCACONTAB(True,'BASEDADOS',DataRef,
                          InttoStr(Sistema.IdModulo),'0',
                          'D','','','','','','','','','','',sMesRef,
                          copy(FieldByName('CODTIPOOBJETO').asString + '     ',1,7),
                          copy(qryAuxContab.FieldByName('DESCRICAO').asString,1,40),
                          sMesRef, '', '',
                          qryTipoOper.FieldByName('TIPCODIGO').AsString,
                          '',
                          qryAuxContab.FieldByName('CONTADEBITO').asString,
                          '',
                          '',
                          liExercicio, liPeriodo,Sistema.IdEmpresa,
                          Sistema.IdUsuario,
                          qryAuxContab.FieldByName('IDPLANO2').asInteger,
                          FieldByName('TOTALPROVAVEL').AsFloat,0,0,0,0,0,0,0,0,'',
                          bConsolida,0,0,sCodSubContaDeb,'',
                          '','',Pln, sMensagem,sMascara,bTestaConta,0,
                          iIDPlanoPrev, iIDPatro, Sistema.UsaPlanoPatro);
                pln := planilha;
              except
                on E:EDBEngineError do
                begin
                  MostrarErro(E);
                  pln := planilha;
                  if pln < 0 then break;
                end;
              end;//try
          end
          else
          begin
              if (bTemAlguma) and
                  (MsgDlg('Conta a Débito Não Encontrada para o Tipo de Objeto ' +
                         IntToStr(iProvento)+
                        ' (Código Interno) e a Matéria ' +
                         trim(FieldByName('INDMATERIA').AsString) +
                        '. Continua o Processo ? ','Confirmação ',
                        mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo)
              then break;
          end;

          bBookMark := False;
          qryAuxContab.First;
          bTemAlguma  := False;
          while not qryAuxContab.Eof do
          begin

            {sSql:='SELECT PLACCUST '+
                  ' FROM PLANOCONTA'+
                  ' WHERE (PLANO  = '+qryAuxContab.FieldByName('IDPLANO2').asString+')'+
                  ' AND (PLACONTA = '+qryAuxContab.FieldByName('CONTACREDITO').asString)+')';
            qryContas.Close;
            qryContas.SQL.Text:=sSql;
            qryContas.Open;}
            bTemContaCC := False;
            if (Trim(qryAuxContab.FieldByName('CONTACREDITO').asString) <> '') then
            begin
               bTemAlguma  := True;
               bTemContaCC := (qryAuxContab.FieldByName('INDMATERIA').asInteger =
                               FieldByName('INDMATERIA').asInteger);
               if bTemContaCC then begin
                  bBookMark := False;
                  break;
               end
               else begin
                  SvNum := qryAuxContab.GetBookmark;
                  bBookMark := qryAuxContab.FieldByName('INDMATERIA').asInteger = 0;
               end;
            end;
            qryAuxContab.Next;
          end;

          if bBookMark then qryAuxContab.GotoBookmark(SvNum);

          if (bBookMark) or (bTemContaCC) then
          begin
              //if not qryAuxContab.FieldByName('CODSUBCREDITO').isNull then begin
              //   sCodSubContaCre:=qryAuxContab.FieldByName('CODSUBCREDITO').asString;
              //end;
              try
                Planilha:=LANCACONTAB(True,'BASEDADOS',DataRef,
                          InttoStr(Sistema.IdModulo),'1',
                          'C','','','','','','','','','','',sMesRef,
                          copy(FieldByName('CODTIPOOBJETO').asString + '     ',1,7),
                          copy(qryAuxContab.FieldByName('DESCRICAO').asString,1,40),
                          sMesRef, '', '',
                          qryTipoOper.FieldByName('TIPCODIGO').AsString,
                          '',
                          '',
                          '',
                          qryAuxContab.FieldByName('CONTACREDITO').asString,
                          liExercicio, liPeriodo,Sistema.IdEmpresa,
                          Sistema.IdUsuario,
                          qryAuxContab.FieldByName('IDPLANO1').asInteger,
                          FieldByName('TOTALPROVAVEL').AsFloat,0,0,0,0,0,0,0,0,'',
                          bConsolida,0,0,'',sCodSubContaCre,
                          '','',Pln, sMensagem,sMascara,bTestaConta,0,
                          iIDPlanoPrev, iIDPatro, Sistema.UsaPlanoPatro);
                 pln := planilha;
               except
                 on E:EDBEngineError do
                 begin
                   pln := planilha;
                   if pln > 0 then pln := -1;
                   if pln < 0 then break;
                 end;
               end;//try
        end
        else
        begin
          if (bTemAlguma) and
             (MsgDlg('Conta a Crébito Não Encontrada para o Tipo de Objeto ' +
                     IntToStr(iProvento) + ' (Código Interno) e a Matéria ' +
                     Trim(FieldByName('INDMATERIA').AsString) +
                     '. Continua o Processo ? ','Confirmação ',
                     mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo) then
            break;
        end;

        // if (FazCAP) and (sCodTipRecDes <> '')  then  FazIntegraCAP;
      end;
      Next;
    end;

    pnlProgresso.Visible := False;
    pnlProgresso.SendToBack;
    if (pln < 0) then
    begin
      dtmBaseDados.dbBaseDados.RollBack;
      MsgDlg('Contabilização do Jurídico abortada pelo erro indicado.',
             'Informação',mtInformation,[mbOk,mbHelp],0);
    end
    else
    begin
      dtmBaseDados.dbBaseDados.Commit;
      MsgDlg('Contabilização do Jurídico efetuada com sucesso.',
             'Informação',mtInformation,[mbOk,mbHelp],0);
    end;
    Close;
  end;
end;

end.
