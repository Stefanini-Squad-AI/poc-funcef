unit RRecebPatro;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, ExtCtrls, wwdblook, Grids, Wwdbigrd, Wwdbgrid, Db,
   DBTables, Wwquery, ComCtrls, wwdbdatetimepicker, Mask, wwdbedit,
   Wwdbspin, fcButton, fcImgBtn, fcShapeBtn, Wwdatsrc, DBCtrls;

type
   TfrmRelRecebPatro = class(TfrmSairAjudaImob)
      pgc: TPageControl;
      tbsPrincipal: TTabSheet;
      tbsParametros: TTabSheet;
      DBcboPatroHist: TwwDBLookupCombo;
      Panel3: TPanel;
      DBgrdItensConcessao: TwwDBGrid;
      Label1: TLabel;
      btnExcluiDocumento: TBitBtn;
      Bevel1: TBevel;
      btnNovoDocumento: TBitBtn;
      Bevel2: TBevel;
      btnVoltar: TfcShapeBtn;
      DBcboPatroLanc: TwwDBLookupCombo;
      Label2: TLabel;
      Panel1: TPanel;
      Label15: TLabel;
      Label5: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      edtDataLancto: TwwDBDateTimePicker;
      Label3: TLabel;
      edtDataVencto: TwwDBDateTimePicker;
      btnConfirma: TBitBtn;
      qryHistRecPatro: TwwQuery;
      qryHistRecPatroIDHISTRECPATROEP: TFloatField;
      qryHistRecPatroIDPATRO: TFloatField;
      qryHistRecPatroCODDOCUMENTO: TFloatField;
      qryHistRecPatroPLNCODIGO: TFloatField;
      qryHistRecPatroRPEVLR: TFloatField;
      qryHistRecPatroRPEMESCOBRANCA: TFloatField;
      qryHistRecPatroRPEANOCOBRANCA: TFloatField;
      dtsHistRecPatro: TwwDataSource;
      qryHistRecPatroNOME: TStringField;
      qryHistRecPatroDATAVENCTO: TDateTimeField;
      qryHistRecPatroMES_EXTENSO: TStringField;
      DBEdit1: TDBEdit;
      DBEdit2: TDBEdit;
      DBEdit3: TDBEdit;
      Label4: TLabel;
      Label6: TLabel;
      qryHistRecPatroRPEDATA: TDateTimeField;
      qryHistRecPatroPLNPLANIL: TFloatField;

      procedure DBgrdItensConcessaoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdItensConcessaoTopRowChanged(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure btnConfirmaClick(Sender: TObject);
      procedure btnVoltarClick(Sender: TObject);
      procedure btnNovoDocumentoClick(Sender: TObject);
      procedure btnExcluiDocumentoClick(Sender: TObject);
      procedure DBcboPatroHistKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure DBcboPatroHistCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);


   private { Private declarations }

      iMoedaCorrente : Integer;

      function VerificaPreenchimento: Boolean;
//      function PegaFechamentoPatro(iPatro: Int64): String;

   public { Public declarations }

   end;



var
   frmRelRecebPatro: TfrmRelRecebPatro;



implementation
{$R *.DFM}
uses
   uDataBase, uMensErro, uDiasUteis, uIntegraEmptmo, uIntegraReceb, DLookEmptmo, dEmptmo,
   uFuncoesEmptmo, uSistema, uVerificaPreenchimento, uModulo;



function TfrmRelRecebPatro.VerificaPreenchimento: Boolean;
{
var
   iPatro         : Int64;
   iAno, iMes     : Integer;
   sMsg, sAnoMes  : String;
}   
begin
	Result := False;

	try

      if DBcboPatroLanc.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar a Patrocinadora para a qual se deseja lançar o Documento de recebimento!', DBcboPatroLanc);

      if cboMes.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário indicar o Mês!', cboMes);

      if DBspnAno.Value <= 1980 then
         raise EValidacao.CreateVal('É necessário indicar o Ano!', DBspnAno);

      if length(trim(edtDataLancto.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Lançamento!', edtDataLancto);

      if length(trim(edtDataVencto.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', edtDataVencto);

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


procedure TfrmRelRecebPatro.DBgrdItensConcessaoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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



procedure TfrmRelRecebPatro.DBgrdItensConcessaoTopRowChanged(Sender: TObject);
begin
   inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmRelRecebPatro.FormShow(Sender: TObject);
begin
   inherited;

   pgc.ActivePage := tbsPrincipal;
   Repaint;

   DBspnAno.Value := DiasUteis.ExtraiAno(SysDate);

   with dtmEmptmo.qryParamGlobal do begin
      LimpaParametros(dtmEmptmo.qryParamGlobal);
      ParamByName('PIDPESSOA').asInteger := Sistema.idEmpresa;
      Open;

      if not(dtmEmptmo.qryParamGlobal.isEmpty) then iMoedaCorrente := dtmEmptmo.qryParamGlobalMOEDACORRENTE.asInteger;

      Close;
   end;

   with dtmLookEmptmo.qryLookPatro do begin
      LimpaParametros(dtmLookEmptmo.qryLookPatro);
      Open;
   end;

   with qryHistRecPatro do begin
      LimpaParametros(qryHistRecPatro);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IdEmpresa;
      ParamByName('PIDMODULO').AsInteger      := Sistema.IdModulo;
      if DBcboPatroHist.LookupValue <> '' then ParamByName('PIDPATRO').AsInteger := StrToInt(DBcboPatroHist.LookupValue);
      Open;
   end;
end;



procedure TfrmRelRecebPatro.btnConfirmaClick(Sender: TObject);
var
   iPatro      : Int64;
   iAno, iMes  : Integer;
   iResult     : Integer;
begin
   inherited;

   if VerificaPreenchimento then
   begin

      iPatro   := StrToInt(DBcboPatroLanc.LookupValue);
      iMes     := (cboMes.ItemIndex + 1);
      iAno     := trunc(DBspnAno.Value);

      try
         StartTransacao;

         iResult := IntegraReceb.GeraRecebimentoPatro(iPatro,
                                                      iAno, iMes,
                                                      edtDataLancto.Date, edtDataVencto.Date,
                                                      iMoedaCorrente,
                                                      Modulo.sCentroCusto,
                                                      Modulo.iPrograma);

         case iResult of
            -2 : MsgDlg('Não há recebimentos para a Patrocinadora indicada.', 'Empréstimo', mtInformation, [mbOk], 0);
            -1, -3, -4, -5, -6 : MsgDlg('Erro na contabilização do Recebimento.', 'Empréstimo', mtError, [mbOk], 0);

            -7 : MsgDlg('Processo interrompido.', 'Empréstimo', mtInformation, [mbOk], 0);

            -8 : MsgDlg('Erro na geração do Documento de Recebimento.', 'Empréstimo', mtError, [mbOk], 0);
            -9 : MsgDlg('Erro ao gravar a Planilha de Recebimento.', 'Empréstimo', mtError, [mbOk], 0);
            -10: MsgDlg('Erro ao gravar o Documento de Recebimento.', 'Empréstimo', mtError, [mbOk], 0);
            -11: MsgDlg('Erro ao gravar o histórico do Recebimento.', 'Empréstimo', mtInformation, [mbOk], 0);
         else
            MsgDlg('Recebimento incluído.', 'Empréstimo', mtInformation, [mbOk], 0);
            Repaint;

            // -------------------------------------------------------------------------------------
            // Log de operações
            if not(Sistema.GravaLogOperacoes('Receb. da Patro ' + DBcboPatroLanc.Text +
                                             ' ref: ' + FormatFloat('00', (cboMes.ItemIndex + 1)) +
                                             '/' + FormatFloat('0000', DBspnAno.Value))) then
            begin
               Raise Exception.Create('Falha na gravação do Log da operação.');
            end;
            // -------------------------------------------------------------------------------------
         end;

         Repaint;

         btnVoltarClick(self);

      except
         Raise;
         Repaint;
      end;
   end;
end;



procedure TfrmRelRecebPatro.btnVoltarClick(Sender: TObject);
begin
   inherited;

   DBcboPatroHist.LookupValue := '';

   with qryHistRecPatro do begin
      LimpaParametros(qryHistRecPatro);
      Open;
   end;

   pgc.ActivePage := tbsPrincipal;
end;



procedure TfrmRelRecebPatro.btnNovoDocumentoClick(Sender: TObject);
begin
   inherited;

   pgc.ActivePage := tbsParametros;
end;



procedure TfrmRelRecebPatro.btnExcluiDocumentoClick(Sender: TObject);
var
   sMsg : String;
begin
   inherited;

   sMsg  := 'EXCLUIR o documento de recebimento da Patrocinadora implicará também na exclusão da ' +
            'contabilização desse recebimento.' + #13 + #13 +
            'Deseja realmente prosseguir?';

   if MsgDlg(sMsg, 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

   try

      if IntegraReceb.ExcluiRecebimentoPatro(qryHistRecPatroIDHISTRECPATROEP.AsInteger,
                                             qryHistRecPatroCODDOCUMENTO.AsInteger,
                                             qryHistRecPatroPLNCODIGO.AsInteger) < 0 then
      begin
         (* mensagem de erro *)
      end;

   finally

      with qryHistRecPatro do begin
         Close;
         Open;
      end;

   end;
end;



procedure TfrmRelRecebPatro.DBcboPatroHistKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   inherited;

   if Key = VK_DELETE then begin
      with qryHistRecPatro do begin
         LimpaParametros(qryHistRecPatro);
         Open;
      end;
   end;
end;



procedure TfrmRelRecebPatro.DBcboPatroHistCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   with qryHistRecPatro do begin
      LimpaParametros(qryHistRecPatro);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IdEmpresa;
      ParamByName('PIDMODULO').AsInteger      := Sistema.IdModulo;
      if DBcboPatroHist.LookupValue <> '' then ParamByName('PIDPATRO').AsInteger := StrToInt(DBcboPatroHist.LookupValue);
      Open;
   end;
end;



end.
