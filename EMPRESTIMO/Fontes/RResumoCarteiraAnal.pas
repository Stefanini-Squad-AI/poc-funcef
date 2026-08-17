unit RResumoCarteiraAnal;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, ExtCtrls, fcButton, fcImgBtn, fcShapeBtn, wwdblook, Mask,
   wwdbedit, Wwdbspin, AxCtrls, OleCtrls, vcf1, Db, DBTables, Wwquery;

type
   TfrmRelResumoCarteiraAnal = class(TfrmSairAjudaImob)
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
      qrySaldoDev: TwwQuery;
      qryConcessoes: TwwQuery;
      qryRenovacoes: TwwQuery;
      qryParcelas: TwwQuery;
      qryAmortizacao: TwwQuery;
      qryQuitacao: TwwQuery;
      qryQuitacaoMorte: TwwQuery;

      procedure cboEventoChange(Sender: TObject);
      procedure btnSelecionaClick(Sender: TObject);
      procedure FormShow(Sender: TObject);


   private { Private declarations }

   public { Public declarations }

   end;



var
  frmRelResumoCarteiraAnal: TfrmRelResumoCarteiraAnal;



implementation
{$R *.DFM}
uses
   uSistema, uDiasUteis, uFuncoesEmptmo, uMensErro;




procedure TfrmRelResumoCarteiraAnal.cboEventoChange(Sender: TObject);
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



procedure TfrmRelResumoCarteiraAnal.btnSelecionaClick(Sender: TObject);
var
   dData  : TDateTime;
   iLinha : Integer;
   bErro  : Boolean;
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

   case cboEvento.ItemIndex of

      0: begin
           with qrySaldoDev do begin
              LimpaParametros(qrySaldoDev);
              ParamByName('dData').AsDateTime := dData;
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
                    Planilha.NumberRC[ilinha, 3] := FieldByName('HMESALDODEV').AsCurrency;
                    Inc(iLinha);
                    Next;
                 end;
           end;
         end; (* Saldo Devedor *)
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
      5: begin
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
      6: begin
           with qryQuitacaoMorte do begin
              LimpaParametros(qryQuitacaoMorte);
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
         end; (* Quitações por Morte *)
   end;

   if bErro then begin
      MsgDlg('Não existem registros que satisfaçam o filtro selecionado','Empréstimo',mtWarning,[mbOK],0);
   end;
end;



procedure TfrmRelResumoCarteiraAnal.FormShow(Sender: TObject);
begin
   inherited;

   cboMes.ItemIndex := DiasUteis.ExtraiMes(Sysdate) - 1;
   DBspnAno.Value   := DiasUteis.ExtraiAno(Sysdate);
end;



end.
