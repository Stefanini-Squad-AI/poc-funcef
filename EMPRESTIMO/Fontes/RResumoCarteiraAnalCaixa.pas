{------------------------Alteração----------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Wylliam Leite da Silva
Data        : 04/05/2015
Descrição   : Ajustar queries para adequação a segregação da HISTMOVEMPTMO
--------------------------------------------------------------------------------}
unit RResumoCarteiraAnalCaixa;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, ExtCtrls, fcButton, fcImgBtn, fcShapeBtn, wwdblook, Mask,
   wwdbedit, Wwdbspin, AxCtrls, OleCtrls, vcf1, Db, DBTables, Wwquery;

type
   TfrmRelResumoCarteiraAnalCaixa = class(TfrmSairAjudaImob)
      cboEvento: TComboBox;
      Label1: TLabel;
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      DBcboTipoContrato: TwwDBLookupCombo;
      Label2: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      Label3: TLabel;
      dblcboItemEmprestimo: TwwDBLookupCombo;
      Label4: TLabel;
      btnSeleciona: TfcShapeBtn;
      RadioGroup1: TRadioGroup;
      Panel2: TPanel;
      planilha: TF1Book;
      Bevel1: TBevel;
      qryConcessoes: TwwQuery;
      qryRenovacoes: TwwQuery;
      qryParcelas: TwwQuery;
      qryAmortizacao: TwwQuery;
      qryQuitacao: TwwQuery;
      qryEncargos: TwwQuery;
      qryValorAberto: TwwQuery;
      qryParcelaMes: TwwQuery;
      qryItensAtraso: TwwQuery;
      qryEncargoRec: TwwQuery;
      qryAmortRec: TwwQuery;
      qryQuitRec: TwwQuery;
      qryValorAtual: TwwQuery;

      procedure cboEventoChange(Sender: TObject);
      procedure btnSelecionaClick(Sender: TObject);
      procedure FormShow(Sender: TObject);

   private { Private declarations }

   public { Public declarations }

   end;



var
   frmRelResumoCarteiraAnalCaixa: TfrmRelResumoCarteiraAnalCaixa;



implementation
{$R *.DFM}
uses
   uSistema, uDiasUteis, uFuncoesEmptmo, uMensErro;




procedure TfrmRelResumoCarteiraAnalCaixa.cboEventoChange(Sender: TObject);
begin
   inherited;


   case cboEvento.ItemIndex of

      0: begin end; (* Saldo Devedor *)
      1: begin end; (* Concessões *)
      2: begin end; (* Renovações *)
      3: begin end; (* Parcelas (todas) *)
      4: begin end; (* Parcelas do Mês *)
      5: begin end; (* Parcelas em Atraso *)
      6: begin end; (* Encargos *)
      7: begin end; (* Amortizações *)
      8: begin end; (* Quitações Antecipadas *)
      9: begin end; (* Quitações por Morte *)

   end;
end;



procedure TfrmRelResumoCarteiraAnalCaixa.btnSelecionaClick(Sender: TObject);
var sData  : String;
    dData  : TDateTime;
    iLinha : Integer;
    bErro  : Boolean;
    sAno, sMes  : String;
    sDataAnt, sDataAtu : String;
    sSQL   : String;
begin
  inherited;
   if cboEvento.Text = '' then begin
      MsgDlg('Favor informar o Evento.','Empréstimo',mtWarning,[mbOK],0);
      Exit;
   end;

   if cboMes.Text = '' then begin
      MsgDlg('Favor informar o Mês de referência.','Empréstimo',mtWarning,[mbOK],0);
      Exit;
   end;

   if DBspnAno.Text = '' then begin
      MsgDlg('Favor informar o Ano de referência.','Empréstimo',mtWarning,[mbOK],0);
      Exit;
   end;

   dData  := StrToDate('01/' + IntToStr(cboMes.ItemIndex + 1) + '/' + IntToStr(Trunc(DBspnAno.Value)));
   dData  := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dData), DiasUteis.ExtraiMes(dData));
   iLinha := 1;
   Planilha.ClearRange(-1, -1, -1, -1, F1ClearValues);
   bErro  := False;

   sAno     := FormatFloat('0000', DBspnAno.Value);
   sMes     := FormatFloat('00', cboMes.ItemIndex + 1);
   sDataAnt := '01/'+sMes+'/'+sAno;
   sDataAtu := FormatDateTime('dd/mm/yyyy',DiasUteis.UltDiaMes(Trunc(DBspnAno.Value),(cboMes.ItemIndex + 1)));

   case cboEvento.ItemIndex of

      0: begin
           sSQL :=
             'SELECT  ' +
             '   C.IDCONTRATOEMPTMO, HME.HMEVLRPREVISTO ' +
             'FROM ' +
             '   HISTMOVEMPTMO HME, CONTRATOEMPTMO C, ' +
             '   ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC ' +
             'WHERE ' +
             '       HMETIPOMOV            IN (1, 2, 3, 4, 6, 7) ' +
             '   AND ( (HME.HMECENTRALIZA  = 1) OR (HME.HMEDESTACADO = 1) ) ' +
             '   AND ( (HME.FLGESTORNADO   = 0) OR (HME.FLGESTORNADO IS NULL) ) ' +
             '   AND C.FLGSITUACAO         <> ''C'' ' +
             '   AND HME.HMEDATAPREVISTA   < TO_DATE(' + QuotedStr(sDataAnt) + ',''DD/MM/YYYY'') ' +

             '   AND ( (HME.FLGQUITADO     IS NULL) OR ((HME.FLGQUITADO IS NOT NULL) AND (HME.HMEDATAQUITABONO > TO_DATE(' + QuotedStr(sDataAnt) + ',''DD/MM/YYYY''))) ) '+
             '   AND ( (HME.FLGABONADO     IS NULL) OR ((HME.FLGABONADO IS NOT NULL) AND (HME.HMEDATAQUITABONO > TO_DATE(' + QuotedStr(sDataAnt) + ',''DD/MM/YYYY''))) ) '+
             '   AND ( (HME.HMEDATAEFETIVA IS NULL) OR (HME.HMEDATAEFETIVA > TO_DATE(' + QuotedStr(sDataAnt) + ',''DD/MM/YYYY'')) ) ';

             if dblcboItemEmprestimo.Text <> '' then
             sSQL := sSQL +
             '   AND ( (HME.IDITEMEMPTMO = ' + dblcboItemEmprestimo.LookupValue + ') ) ';

             if DBcboTipoContrato.Text <> '' then
             sSQL := sSQL +
             '   AND ( (C.IDTIPOCONTREMPTMO = '+ DBcboTipoContrato.LookupValue + ') ) ';

             if DBcboTipoEmptmo.Text <> '' then
             sSQL := sSQL +
             '   AND ( (TC.IDTIPOEMPTMO = '+ DBcboTipoEmptmo.LookupValue + ') ) ';

             sSQL := sSQL +
             '   AND HME.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO '+
             '   AND C.IDTIPOCONTREMPTMO   = TC.IDTIPOCONTREMPTMO '+
             '   AND TC.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO '+
             '   AND HME.IDITEMEMPTMO      = ITC.IDITEMEMPTMO '+

             'ORDER BY C.IDCONTRATOEMPTMO ';

           with qryValorAberto do begin
              Close;
              Sql.Text := sSQL;
              Open;
              if IsEmpty then
                 bErro  := True
              else
                 while not eof do begin
                    Planilha.TextRC[ilinha, 2]   := FieldByName('IDCONTRATOEMPTMO').AsString;
                    Planilha.NumberRC[ilinha, 3] := FieldByName('HMEVLRPREVISTO').AsCurrency;
                    Inc(iLinha);
                    Next;
                 end;
           end;
         end; (* Valor Anterior em Aberto *)

      1: begin
           with qryConcessoes do begin
              LimpaParametros(qryConcessoes);
              ParamByName('sAno').AsInteger := DiasUteis.ExtraiAno(dData);
              ParamByName('sMes').AsInteger := DiasUteis.ExtraiMes(dData);
              if dblcboItemEmprestimo.Text <> '' then
                 ParamByName('PIDITEMEMPTMO').AsInteger := StrToInt(dblcboItemEmprestimo.LookupValue);
              if DBcboTipoEmptmo.Text <> '' then
                 ParamByName('PIDTIPOEMPTMO').AsInteger := StrToInt(DBcboTipoEmptmo.LookupValue);
              if DBcboTipoContrato.Text <> '' then
                 ParamByName('PIDTIPOCONTREMPTMO').AsInteger := StrToInt(DBcboTipoContrato.LookupValue);
              Open;
              if IsEmpty then
                 bErro  := True
              else
                 while not eof do begin
                    Planilha.TextRC[ilinha, 2]   := FieldByName('IDCONTRATOEMPTMO').AsString;
                    Planilha.NumberRC[ilinha, 3] := FieldByName('HMEVLRPREVISTO').AsCurrency;
                    Inc(iLinha);
                    Next;
                 end;
           end;
         end; (* Concessões *)
      2: begin
           with qryRenovacoes do begin
              LimpaParametros(qryRenovacoes);
              ParamByName('sAno').AsInteger := DiasUteis.ExtraiAno(dData);
              ParamByName('sMes').AsInteger := DiasUteis.ExtraiMes(dData);
              if dblcboItemEmprestimo.Text <> '' then
                 ParamByName('PIDITEMEMPTMO').AsInteger := StrToInt(dblcboItemEmprestimo.LookupValue);
              if DBcboTipoEmptmo.Text <> '' then
                 ParamByName('PIDTIPOEMPTMO').AsInteger := StrToInt(DBcboTipoEmptmo.LookupValue);
              if DBcboTipoContrato.Text <> '' then
                 ParamByName('PIDTIPOCONTREMPTMO').AsInteger := StrToInt(DBcboTipoContrato.LookupValue);
              Open;
              if IsEmpty then
                 bErro  := True
              else
                 while not eof do begin
                    Planilha.TextRC[ilinha, 2]   := FieldByName('IDCONTRATOEMPTMO').AsString;
                    Planilha.NumberRC[ilinha, 3] := FieldByName('HMEVLRPREVISTO').AsCurrency;
                    Inc(iLinha);
                    Next;
                 end;
           end;
         end; (* Renovações *)
      3: begin
           with qryParcelas do begin
              LimpaParametros(qryParcelas);
              ParamByName('sAno').AsInteger := DiasUteis.ExtraiAno(dData);
              ParamByName('sMes').AsInteger := DiasUteis.ExtraiMes(dData);
              if dblcboItemEmprestimo.Text <> '' then
                 ParamByName('PIDITEMEMPTMO').AsInteger := StrToInt(dblcboItemEmprestimo.LookupValue);
              if DBcboTipoEmptmo.Text <> '' then
                 ParamByName('PIDTIPOEMPTMO').AsInteger := StrToInt(DBcboTipoEmptmo.LookupValue);
              if DBcboTipoContrato.Text <> '' then
                 ParamByName('PIDTIPOCONTREMPTMO').AsInteger := StrToInt(DBcboTipoContrato.LookupValue);
              Open;
              if IsEmpty then
                 bErro  := True
              else
                 while not eof do begin
                    Planilha.TextRC[ilinha, 2]   := FieldByName('IDCONTRATOEMPTMO').AsString;
                    Planilha.NumberRC[ilinha, 3] := FieldByName('HMEVLRPREVISTO').AsCurrency;
                    Inc(iLinha);
                    Next;
                 end;
           end;
         end; (* Parcelas do Mês *)
      4: begin
           with qryEncargos do begin
              LimpaParametros(qryEncargos);
              ParamByName('sAno').AsInteger := DiasUteis.ExtraiAno(dData);
              ParamByName('sMes').AsInteger := DiasUteis.ExtraiMes(dData);
              if dblcboItemEmprestimo.Text <> '' then
                 ParamByName('PIDITEMEMPTMO').AsInteger := StrToInt(dblcboItemEmprestimo.LookupValue);
              if DBcboTipoEmptmo.Text <> '' then
                 ParamByName('PIDTIPOEMPTMO').AsInteger := StrToInt(DBcboTipoEmptmo.LookupValue);
              if DBcboTipoContrato.Text <> '' then
                 ParamByName('PIDTIPOCONTREMPTMO').AsInteger := StrToInt(DBcboTipoContrato.LookupValue);
              Open;
              if IsEmpty then
                 bErro  := True
              else
                 while not eof do begin
                    Planilha.TextRC[ilinha, 2]   := FieldByName('IDCONTRATOEMPTMO').AsString;
                    Planilha.NumberRC[ilinha, 3] := FieldByName('HMEVLRPREVISTO').AsCurrency;
                    Inc(iLinha);
                    Next;
                 end;
           end;
         end; (* Encargos *)
      5: begin
           with qryAmortizacao do begin
              LimpaParametros(qryAmortizacao);
              ParamByName('sAno').AsInteger := DiasUteis.ExtraiAno(dData);
              ParamByName('sMes').AsInteger := DiasUteis.ExtraiMes(dData);
              if dblcboItemEmprestimo.Text <> '' then
                 ParamByName('PIDITEMEMPTMO').AsInteger := StrToInt(dblcboItemEmprestimo.LookupValue);
              if DBcboTipoEmptmo.Text <> '' then
                 ParamByName('PIDTIPOEMPTMO').AsInteger := StrToInt(DBcboTipoEmptmo.LookupValue);
              if DBcboTipoContrato.Text <> '' then
                 ParamByName('PIDTIPOCONTREMPTMO').AsInteger := StrToInt(DBcboTipoContrato.LookupValue);
              Open;
              if IsEmpty then
                 bErro  := True
              else
                 while not eof do begin
                    Planilha.TextRC[ilinha, 2]   := FieldByName('IDCONTRATOEMPTMO').AsString;
                    Planilha.NumberRC[ilinha, 3] := FieldByName('HMEVLRPREVISTO').AsCurrency;
                    Inc(iLinha);
                    Next;
                 end;
           end;
         end; (* Amortizações *)
      6: begin
           with qryQuitacao do begin
              LimpaParametros(qryQuitacao);
              ParamByName('sAno').AsInteger := DiasUteis.ExtraiAno(dData);
              ParamByName('sMes').AsInteger := DiasUteis.ExtraiMes(dData);
              if dblcboItemEmprestimo.Text <> '' then
                 ParamByName('PIDITEMEMPTMO').AsInteger := StrToInt(dblcboItemEmprestimo.LookupValue);
              if DBcboTipoEmptmo.Text <> '' then
                 ParamByName('PIDTIPOEMPTMO').AsInteger := StrToInt(DBcboTipoEmptmo.LookupValue);
              if DBcboTipoContrato.Text <> '' then
                 ParamByName('PIDTIPOCONTREMPTMO').AsInteger := StrToInt(DBcboTipoContrato.LookupValue);
              Open;
              if IsEmpty then
                 bErro  := True
              else
                 while not eof do begin
                    Planilha.TextRC[ilinha, 2]   := FieldByName('IDCONTRATOEMPTMO').AsString;
                    Planilha.NumberRC[ilinha, 3] := FieldByName('HMEVLRPREVISTO').AsCurrency;
                    Inc(iLinha);
                    Next;
                 end;
           end;
         end; (* Quitações Antecipadas *)
      7: begin
           with qryParcelaMes do begin
              LimpaParametros(qryParcelaMes);
              ParamByName('sAno').AsInteger := DiasUteis.ExtraiAno(dData);
              ParamByName('sMes').AsInteger := DiasUteis.ExtraiMes(dData);
              if dblcboItemEmprestimo.Text <> '' then
                 ParamByName('PIDITEMEMPTMO').AsInteger := StrToInt(dblcboItemEmprestimo.LookupValue);
              if DBcboTipoEmptmo.Text <> '' then
                 ParamByName('PIDTIPOEMPTMO').AsInteger := StrToInt(DBcboTipoEmptmo.LookupValue);
              if DBcboTipoContrato.Text <> '' then
                 ParamByName('PIDTIPOCONTREMPTMO').AsInteger := StrToInt(DBcboTipoContrato.LookupValue);
              Open;
              if IsEmpty then
                 bErro  := True
              else
                 while not eof do begin
                    Planilha.TextRC[ilinha, 2]   := FieldByName('IDCONTRATOEMPTMO').AsString;
                    Planilha.NumberRC[ilinha, 3] := FieldByName('HMEVLREFETIVO').AsCurrency;
                    Inc(iLinha);
                    Next;
                 end;
           end;

         end; (* Parcelas do Mês (recebimentos) *)
      8: begin
           with qryItensAtraso do begin
              LimpaParametros(qryItensAtraso);
              ParamByName('sAno').AsInteger   := DiasUteis.ExtraiAno(dData);
              ParamByName('sMes').AsInteger   := DiasUteis.ExtraiMes(dData);
              ParamByName('sAnoMes').AsString := sAno+sMes;
              if dblcboItemEmprestimo.Text <> '' then
                 ParamByName('PIDITEMEMPTMO').AsInteger := StrToInt(dblcboItemEmprestimo.LookupValue);
              if DBcboTipoEmptmo.Text <> '' then
                 ParamByName('PIDTIPOEMPTMO').AsInteger := StrToInt(DBcboTipoEmptmo.LookupValue);
              if DBcboTipoContrato.Text <> '' then
                 ParamByName('PIDTIPOCONTREMPTMO').AsInteger := StrToInt(DBcboTipoContrato.LookupValue);
              Open;
              if IsEmpty then
                 bErro  := True
              else
                 while not eof do begin
                    Planilha.TextRC[ilinha, 2]   := FieldByName('IDCONTRATOEMPTMO').AsString;
                    Planilha.NumberRC[ilinha, 3] := FieldByName('HMEVLREFETIVO').AsCurrency;
                    Inc(iLinha);
                    Next;
                 end;
           end;
         end; (* Itens em Atraso (recebimentos) *)
      9: begin
           with qryEncargoRec do begin
              LimpaParametros(qryEncargoRec);
              ParamByName('sAno').AsInteger := DiasUteis.ExtraiAno(dData);
              ParamByName('sMes').AsInteger := DiasUteis.ExtraiMes(dData);
              if dblcboItemEmprestimo.Text <> '' then
                 ParamByName('PIDITEMEMPTMO').AsInteger := StrToInt(dblcboItemEmprestimo.LookupValue);
              if DBcboTipoEmptmo.Text <> '' then
                 ParamByName('PIDTIPOEMPTMO').AsInteger := StrToInt(DBcboTipoEmptmo.LookupValue);
              if DBcboTipoContrato.Text <> '' then
                 ParamByName('PIDTIPOCONTREMPTMO').AsInteger := StrToInt(DBcboTipoContrato.LookupValue);
              Open;
              if IsEmpty then
                 bErro  := True
              else
                 while not eof do begin
                    Planilha.TextRC[ilinha, 2]   := FieldByName('IDCONTRATOEMPTMO').AsString;
                    Planilha.NumberRC[ilinha, 3] := FieldByName('HMEVLREFETIVO').AsCurrency;
                    Inc(iLinha);
                    Next;
                 end;
           end;

         end; (* Encargos (recebimentos) *)
     10: begin
           with qryAmortRec do begin
              LimpaParametros(qryAmortRec);
              ParamByName('sAno').AsInteger := DiasUteis.ExtraiAno(dData);
              ParamByName('sMes').AsInteger := DiasUteis.ExtraiMes(dData);
              if dblcboItemEmprestimo.Text <> '' then
                 ParamByName('PIDITEMEMPTMO').AsInteger := StrToInt(dblcboItemEmprestimo.LookupValue);
              if DBcboTipoEmptmo.Text <> '' then
                 ParamByName('PIDTIPOEMPTMO').AsInteger := StrToInt(DBcboTipoEmptmo.LookupValue);
              if DBcboTipoContrato.Text <> '' then
                 ParamByName('PIDTIPOCONTREMPTMO').AsInteger := StrToInt(DBcboTipoContrato.LookupValue);
              Open;
              if IsEmpty then
                 bErro  := True
              else
                 while not eof do begin
                    Planilha.TextRC[ilinha, 2]   := FieldByName('IDCONTRATOEMPTMO').AsString;
                    Planilha.NumberRC[ilinha, 3] := FieldByName('HMEVLREFETIVO').AsCurrency;
                    Inc(iLinha);
                    Next;
                 end;
           end;

         end; (* Amortizações (recebimentos) *)
     11: begin
           with qryQuitRec do begin
              LimpaParametros(qryQuitRec);
              ParamByName('sAno').AsInteger := DiasUteis.ExtraiAno(dData);
              ParamByName('sMes').AsInteger := DiasUteis.ExtraiMes(dData);
              if dblcboItemEmprestimo.Text <> '' then
                 ParamByName('PIDITEMEMPTMO').AsInteger := StrToInt(dblcboItemEmprestimo.LookupValue);
              if DBcboTipoEmptmo.Text <> '' then
                 ParamByName('PIDTIPOEMPTMO').AsInteger := StrToInt(DBcboTipoEmptmo.LookupValue);
              if DBcboTipoContrato.Text <> '' then
                 ParamByName('PIDTIPOCONTREMPTMO').AsInteger := StrToInt(DBcboTipoContrato.LookupValue);
              Open;
              if IsEmpty then
                 bErro  := True
              else
                 while not eof do begin
                    Planilha.TextRC[ilinha, 2]   := FieldByName('IDCONTRATOEMPTMO').AsString;
                    Planilha.NumberRC[ilinha, 3] := FieldByName('HMEVLREFETIVO').AsCurrency;
                    Inc(iLinha);
                    Next;
                 end;
           end;

         end; (* Quitações (recebimentos) *)
     12: begin
           with qryValorAtual do begin
              LimpaParametros(qryValorAtual);
              ParamByName('sDataAnt').AsString := sDataAtu;
              if dblcboItemEmprestimo.Text <> '' then
                 ParamByName('PIDITEMEMPTMO').AsInteger := StrToInt(dblcboItemEmprestimo.LookupValue);
              if DBcboTipoEmptmo.Text <> '' then
                 ParamByName('PIDTIPOEMPTMO').AsInteger := StrToInt(DBcboTipoEmptmo.LookupValue);
              if DBcboTipoContrato.Text <> '' then
                 ParamByName('PIDTIPOCONTREMPTMO').AsInteger := StrToInt(DBcboTipoContrato.LookupValue);
              Open;
              if IsEmpty then
                 bErro  := True
              else
                 while not eof do begin
                    Planilha.TextRC[ilinha, 2]   := FieldByName('IDCONTRATOEMPTMO').AsString;
                    Planilha.NumberRC[ilinha, 3] := FieldByName('HMEVLRPREVISTO').AsCurrency;
                    Inc(iLinha);
                    Next;
                 end;
           end;
         end; (* Valor Atual em Aberto *)
   end;

   if not bErro then begin
      sSQL := 'SUM(C1..C'+IntToStr(iLinha-1)+')';
      Inc(iLinha);
      Planilha.TextRC[ilinha, 2]   := 'Total';
      Planilha.FormulaRC[iLinha,3] := sSQL;
   end else begin
      MsgDlg('Não existem registros que satisfaçam o filtro selecionado','Empréstimo',mtWarning,[mbOK],0);
   end;
end;



procedure TfrmRelResumoCarteiraAnalCaixa.FormShow(Sender: TObject);
begin
   inherited;

   cboMes.ItemIndex := DiasUteis.ExtraiMes(Sysdate) - 1;
   DBspnAno.Value   := DiasUteis.ExtraiAno(Sysdate);
end;



end.
