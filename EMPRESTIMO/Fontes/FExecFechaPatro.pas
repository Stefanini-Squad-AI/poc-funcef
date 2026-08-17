unit FExecFechaPatro;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelarImob, StdCtrls, wwdblook, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, Mask, wwdbedit, Wwdbspin, Db, DBTables, Wwquery, Grids,
  Wwdbigrd, Wwdbgrid, Wwdatsrc, FSairAjudaImob;

type
   TNovosDados = record
      Valor          : Double;
      FlgDivergPend  : Integer;
      FlgBaixado     : Integer;
   end;

   TfrmExecFechaPatro = class(TfrmSairAjudaImob)
      Label3: TLabel;
    cboMesPatro: TComboBox;
    DBspnAnoPatro: TwwDBSpinEdit;
      qryUpdatePatro: TwwQuery;
      qryUpdatePatroIDPESSOA: TFloatField;
      qryUpdatePatroNOME: TStringField;
      DBgrdItensConcessao: TwwDBGrid;
      Panel3: TPanel;
      dsPatro: TwwDataSource;
      Panel1: TPanel;
      Panel2: TPanel;
      Label1: TLabel;
    cboMesCAPCAR: TComboBox;
    DBspnAnoCAPCAR: TwwDBSpinEdit;
      Panel4: TPanel;
      Label2: TLabel;
      Label4: TLabel;
      cboMesFolha: TComboBox;
      DBspnAnoFolha: TwwDBSpinEdit;
      btnUpdatePatro: TBitBtn;
      btnUpdateFolha: TBitBtn;
      btnUpdateCAPCAR: TBitBtn;
      qryUpdateCAPCAR: TwwQuery;
      FloatField1: TFloatField;
      StringField1: TStringField;
      qryUpdateFolha: TwwQuery;
      FloatField2: TFloatField;
      StringField2: TStringField;
      qryUpdateRecebimento: TwwQuery;
      FloatField3: TFloatField;
      StringField3: TStringField;
      Label5: TLabel;
      cboMesRecebimento: TComboBox;
      DBSpnAnoRecebimento: TwwDBSpinEdit;
      btnUpdateRecebimento: TBitBtn;

      procedure FormShow(Sender: TObject);
      procedure DBgrdItensConcessaoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdItensConcessaoTopRowChanged(Sender: TObject);
      procedure btnUpdatePatroClick(Sender: TObject);
      procedure btnUpdateFolhaClick(Sender: TObject);
      procedure btnUpdateCAPCARClick(Sender: TObject);
      procedure btnUpdateRecebimentoClick(Sender: TObject);


   private { Private declarations }

      function VerificaPreenchimentoPatro: Boolean;
      function VerificaPreenchimentoFolha: Boolean;
      function VerificaPreenchimentoCAPCAR: Boolean;
      function VerificaPreenchimentoRecebimento: Boolean;
      procedure InsereDiferencaHist (qryLocal: TwwQuery; NovosDados: TNovosDados);


   public { Public declarations }


   end;



var
  frmExecFechaPatro: TfrmExecFechaPatro;



implementation
{$R *.DFM}
uses
   uMensErro, uFuncoesEmptmo, dEmptmo, dLookEmptmo, uVerificaPreenchimento, uDiasInUteis, uSistema,
   uTypesEMptmo, uCalcEmptmo;



function TfrmExecFechaPatro.VerificaPreenchimentoPatro: Boolean;
begin
	Result := False;

	try
      if cboMesPatro.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário indicar o novo Mês!', cboMesPatro);

      if DBspnAnoPatro.Value <= 1980 then
         raise EValidacao.CreateVal('É necessário indicar o novo Ano!', DBspnAnoPatro);

   except

      on ev : EValidacao do begin
		   if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



function TfrmExecFechaPatro.VerificaPreenchimentoFolha: Boolean;
begin
	Result := False;

	try
      if cboMesFolha.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário indicar o novo Mês!', cboMesFolha);

      if DBspnAnoFolha.Value <= 1980 then
         raise EValidacao.CreateVal('É necessário indicar o novo Ano!', DBspnAnoFolha);

   except

      on ev : EValidacao do begin
		   if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



function TfrmExecFechaPatro.VerificaPreenchimentoCAPCAR: Boolean;
begin
	Result := False;

	try
      if cboMesCAPCAR.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário indicar o novo Mês!', cboMesCAPCAR);

      if DBspnAnoCAPCAR.Value <= 1980 then
         raise EValidacao.CreateVal('É necessário indicar o novo Ano!', DBspnAnoCAPCAR);

   except

      on ev : EValidacao do begin
		   if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



function TfrmExecFechaPatro.VerificaPreenchimentoRecebimento: Boolean;
begin
	Result := False;

	try
      if cboMesPatro.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário indicar o Mês!', cboMesRecebimento);

      if DBspnAnoPatro.Value <= 1980 then
         raise EValidacao.CreateVal('É necessário indicar o Ano!', DBSpnAnoRecebimento);

   except

      on ev : EValidacao do begin
		   if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TfrmExecFechaPatro.FormShow(Sender: TObject);
begin
   inherited;

   with dtmLookEmptmo.qryLookPatro do begin
      LimpaParametros(dtmLookEmptmo.qryLookPatro);
      Open;
   end;

   DBspnAnoPatro.Value         := DiasInUteis.ExtraiAno(Sysdate);
   DBspnAnoFolha.Value         := DiasInUteis.ExtraiAno(Sysdate);
   DBspnAnoCAPCAR.Value        := DiasInUteis.ExtraiAno(Sysdate);
   DBSpnAnoRecebimento.Value   := DiasInUteis.ExtraiAno(Sysdate);
   cboMesRecebimento.ItemIndex := DiasInUteis.ExtraiMes(Sysdate) - 2;
end;



procedure TfrmExecFechaPatro.DBgrdItensConcessaoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   (* faz com que as linhas do grid tenham cores alternadas *)
   if State <> [gdSelected] then begin

      if not Highlight then begin
         (* linhas ímpares = amarelo, linhas pares = branco *)
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; (* amarelo bebê *)
         end else begin
            ABrush.Color := clWhite;
         end;
      end;

   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecFechaPatro.DBgrdItensConcessaoTopRowChanged(Sender: TObject);
begin
   inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecFechaPatro.btnUpdatePatroClick(Sender: TObject);
var
   x : TBookmark;
begin
   if VerificaPreenchimentoPatro then begin

      with qryUpdatePatro do begin
         LimpaParametros(qryUpdatePatro);
         ParamByName('PIDPATRO').AsInteger         := dtmLookEmptmo.qryLookPatroIDPESSOA.AsInteger;
         ParamByName('PANOFECHAEMPTMO').AsInteger  := trunc(DBspnAnoPatro.Value);
         ParamByName('PMESFECHAEMPTMO').AsInteger  := (cboMesPatro.ItemIndex + 1);
         ExecSQL;
      end;

      with dtmLookEmptmo.qryLookPatro do begin
         x := GetBookmark;
         LimpaParametros(dtmLookEmptmo.qryLookPatro);
         Open;
         GotoBookmark(x);
         FreeBookmark(x);
      end;

   end;
end;



procedure TfrmExecFechaPatro.btnUpdateFolhaClick(Sender: TObject);
var
   x : TBookmark;
begin
   if VerificaPreenchimentoFolha then begin

      with qryUpdateFolha do begin
         LimpaParametros(qryUpdateFolha);
         ParamByName('PIDPATRO').AsInteger         := dtmLookEmptmo.qryLookPatroIDPESSOA.AsInteger;
         ParamByName('PANOFECHAEMPTMO').AsInteger  := trunc(DBspnAnoFolha.Value);
         ParamByName('PMESFECHAEMPTMO').AsInteger  := (cboMesFolha.ItemIndex + 1);
         ExecSQL;
      end;

      with dtmLookEmptmo.qryLookPatro do begin
         x := GetBookmark;
         LimpaParametros(dtmLookEmptmo.qryLookPatro);
         Open;
         GotoBookmark(x);
         FreeBookmark(x);
      end;

   end;
end;



procedure TfrmExecFechaPatro.btnUpdateCAPCARClick(Sender: TObject);
var
   x : TBookmark;
begin

   if VerificaPreenchimentoCAPCAR then begin

      with qryUpdateCAPCAR do begin
         LimpaParametros(qryUpdateCAPCAR);
         ParamByName('PIDPATRO').AsInteger         := dtmLookEmptmo.qryLookPatroIDPESSOA.AsInteger;
         ParamByName('PANOFECHAEMPTMO').AsInteger  := trunc(DBspnAnoCAPCAR.Value);
         ParamByName('PMESFECHAEMPTMO').AsInteger  := (cboMesCAPCAR.ItemIndex + 1);
         ExecSQL;
      end;

      with dtmLookEmptmo.qryLookPatro do begin
         x := GetBookmark;
         LimpaParametros(dtmLookEmptmo.qryLookPatro);
         Open;
         GotoBookmark(x);
         FreeBookmark(x);
      end;

   end;
end;



procedure TfrmExecFechaPatro.btnUpdateRecebimentoClick(Sender: TObject);
var
   NovosDadosParcela             : TNovosDados;
begin
  inherited;

   if MsgDlg('Confirma fechamento de recebimento?','Empréstimo', mtConfirmation, [mbYes,mbNo],0) = mrYes then begin

      if VerificaPreenchimentoRecebimento then begin

         with qryUpdateRecebimento do begin
            LimpaParametros(qryUpdateRecebimento);
            ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
            ParamByName('PHMEANOCOBRANCA').AsInteger  := trunc(DBspnAnoRecebimento.Value);
            ParamByName('PHMEMESCOBRANCA').AsInteger  := (cboMesRecebimento.ItemIndex + 1);
            Open;
            while not eof do begin

               NovosDadosParcela.Valor          := FieldByName('HMEVLRPREVISTO').AsCurrency;
               NovosDadosParcela.FlgBaixado     := 0;
               NovosDadosParcela.FlgDivergPend  := 1;

               { Inclui diferença a receber no Historico }
               InsereDiferencaHist(qryUpdateRecebimento, NovosDadosParcela);

               { Atualiza Tabela de Historico }
               LimpaParametros(dtmEmptmo.qryAuxEmptmo);
               dtmEmptmo.qryAuxEmptmo.SQL.Clear;
               dtmEmptmo.qryAuxEmptmo.SQL.Add(
                 'UPDATE HISTMOVEMPTMO SET ' +
                 '       HMEDATAEFETIVA = TO_DATE(' + QuotedStr(FieldByName('HMEDATAPREVISTA').AsString) + ', ''DD/MM/YYYY''), ' +
                 '       HMEVLREFETIVO  = 0'                  + ', ' +
                 '       FLGBAIXADO     = NULL'               + ', ' +
                 '       FLGDIVERGPEND  = NULL'               + ', ' +
                 '       FLGRECEBIMENTO = 0'                  + '  ' +
                 'WHERE  IDHISTMOVEMPTMO = ' + FieldByName('IDHISTMOVEMPTMO').AsString);
               dtmEmptmo.qryAuxEmptmo.ExecSQL;
               Next;
            end;
         end;
      end;
   end;
end;



procedure TfrmExecFechaPatro.InsereDiferencaHist(qryLocal:TwwQuery; NovosDados:TNovosDados);
var
   rContrato      : TDadosContrato;
   ItemContrato   : TItemRecDep;
   iIdHistMovEmptmo : Int64;
begin

   try
     (* Limpa o registro com os dados do Contrato *)
     LimpaRegistroContrato(rContrato);

     (* Inicializa o registro com os dados do Contrato *)
     rContrato.IDContratoEmptmo      := qryLocal.FieldByName('IDCONTRATOEMPTMO').AsInteger;

     { Preenche dados do Item }
     ItemContrato.Parcela            := qryLocal.FieldByName('HMEPARCELA').AsInteger;
     ItemContrato.CodigoItem         := qryLocal.FieldByName('IDITEMEMPTMO').AsInteger;
     ItemContrato.RecPag             := qryLocal.FieldByName('HMERECPAG').AsString;
     ItemContrato.FormaCobranca      := qryLocal.FieldByName('HMEFORMACOBRANCA').AsString;
     ItemContrato.IdItemCentraliza   := qryLocal.FieldByName('IDITEMCENTRALIZA').AsInteger;

     ItemContrato.DataPrevista       := qryLocal.FieldByName('HMEDATAPREVISTA').AsDateTime;
     ItemContrato.DataUltAtualiza    := qryLocal.FieldByName('HMEDATAATUALIZA').AsDateTime;
     ItemContrato.AnoCompetencia     := qryLocal.FieldByName('HMEANOCOMPETENCIA').AsInteger;
     ItemContrato.MesCompetencia     := qryLocal.FieldByName('HMEMESCOMPETENCIA').AsInteger;

     ItemContrato.AnoCobranca        := qryLocal.FieldByName('HMEANOCOBRANCA').AsInteger;
     ItemContrato.MesCobranca        := qryLocal.FieldByName('HMEMESCOBRANCA').AsInteger;

     ItemContrato.Valor              := NovosDados.Valor;
     ItemContrato.SaldoDevedor       := qryLocal.FieldByName('HMESALDODEV').AsFloat;
     ItemContrato.TxJuros            := qryLocal.FieldByName('HMETXJUROS').AsFloat;
     ItemContrato.Regra              := qryLocal.FieldByName('IDREGRA').AsInteger;
     ItemContrato.Rubrica            := qryLocal.FieldByName('IDRUBRICA').AsInteger;

     ItemContrato.iEvento            := qryLocal.FieldByName('HMETIPOMOV').AsInteger;
     ItemContrato.Origem             := qryLocal.FieldByName('HMEORIGEM').AsInteger;
     ItemContrato.Prioridade         := qryLocal.FieldByName('HMEPRIORIDADE').AsInteger;
     ItemContrato.SeqCobranca        := (qryLocal.FieldByName('HMESEQCOBRANCA').AsInteger + 1);
     ItemContrato.FlgCentraliza      := qryLocal.FieldByName('HMECENTRALIZA').AsInteger;
     ItemContrato.FlgEnvio           := 0;
     ItemContrato.FlgBaixado         := NovosDados.FlgBaixado;
     ItemContrato.FlgDivergPend      := NovosDados.FlgDivergPend;
     ItemContrato.ParcResta          := qryLocal.FieldByName('HMENUMPARCELAS').AsInteger;
     ItemContrato.FlgDestacado       := qryLocal.FieldByName('HMEDESTACADO').AsInteger;


     (* função que grava as informações pertinentes a um contrato no histórico de movimento
        de Empréstimo (tabela HISTMOVEMPTMO), tendo como saída True se a operação foi
        bem sucedida e False caso negativo *)
     if not(CalcEmptmo.InsertMovEmptmo(ItemContrato, rContrato, iIdHistMovEmptmo)) then begin
        ShowMessage('Erro ao incluir Histórico !!!!');
     end;

   finally
      (* Limpa o registro com os dados do Contrato *)
      LimpaRegistroContrato(rContrato);
   end;
end;




end.
