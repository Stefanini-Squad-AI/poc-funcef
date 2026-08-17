unit fParamMovAnaPer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery,  
  TREdit, Mask, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamMovAnaPer = class(TfrmOkCancelar)
    rGrpOrdem: TRadioGroup;
    Label1: TLabel;
    dtedIni: TCMDateTimePicker;
    Label3: TLabel;
    dtedFim: TCMDateTimePicker;
    rdgrpMovim: TRadioGroup;
    qrySldCtb: TwwQuery;
    qrySldCtbIDBEM: TFloatField;
    qrySldCtbIDPESSOA: TFloatField;
    qrySldCtbVALCTB: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamMovAnaPer: TfrmParamMovAnaPer;

implementation

uses uSistema, dRelOperCaf,  uMensErro;

{$R *.DFM}

procedure TfrmParamMovAnaPer.FormCreate(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   //-------------------------------------------------------------------------------------
   qrySldCtb.Prepare;
   //-------------------------------------------------------------------------------------
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmParamMovAnaPer.FormActivate(Sender: TObject);
begin
   inherited;
   dtedIni.SetFocus;
end;
//========================================================================================
procedure TfrmParamMovAnaPer.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   with dtmRelOperCaf.qryMovAnaPer do
   begin
      Close;
      UnPrepare;
      //----------------------------------------------------------------------------------
      if dtedIni.Text <> '' then
         SQL.Strings[26] := '(HMOV.DATAMOVIMENTACAO >= TO_DATE('+#39+dtedIni.Text+#39+','+#39+'DD/MM/YYYY'+#39+')) AND'
      else
         SQL.Strings[26] := '';
      //----------------------------------------------------------------------------------
      if dtedFim.Text <> '' then
         SQL.Strings[27] := '(HMOV.DATAMOVIMENTACAO <= TO_DATE('+#39+dtedFim.Text+#39+','+#39+'DD/MM/YYYY'+#39+')) AND'
      else
         SQL.Strings[27] := '';
      //----------------------------------------------------------------------------------
      case rdgrpMovim.ItemIndex  of
         0: SQL.Strings[28] := '(HMOV.IDTIPOMOVIMENTACAO IN (01,03))    AND ';
         1: SQL.Strings[28] := '(HMOV.IDTIPOMOVIMENTACAO = 06)          AND ';
         2: SQL.Strings[28] := '(HMOV.IDTIPOMOVIMENTACAO IN (05,11,12)) AND ';
      end;
      //----------------------------------------------------------------------------------
      case rGrpOrdem.ItemIndex of
         0: SQL.Strings[44] := ' ORDER BY HMOV.DATAMOVIMENTACAO, HMOV.IDMOVIMENTACAO, BEM.PLACA ';
         1: SQL.Strings[44] := ' ORDER BY HMOV.DATAMOVIMENTACAO, HMOV.IDMOVIMENTACAO, BEM.DESBEM ';
      end;
      //----------------------------------------------------------------------------------
      Prepare;
      ParamByName('PDATAFIM').AsDateTime := dtEdFim.Date;
      ParamByName('PIDPESSOA').AsFloat   := Sistema.IdEmpresa;
   end;
   //-------------------------------------------------------------------------------------
   if rdgrpMovim.ItemIndex = 0 then
   begin
      dtmRelOperCaf.ppLabel118.Caption           := 'Entradas';
      dtmRelOperCaf.rpMovAnaPerDBCalc2.DataField := 'VALOFI';
      dtmRelOperCaf.rpMovAnaPerDBCalc3.DataField := 'VALOFI';
      dtmRelOperCaf.rpMovAnaPerDBText4.DataField := 'VALOFI';
      dtmRelOperCaf.rpMovAnaPerLabel5.Caption    := 'Valor (R$)';
      dtmRelOperCaf.rpMovAnaPerDBText5.DataField := 'NOMEFORNEC';
      dtmRelOperCaf.rpMovAnaPerLabel6.Caption    := 'Fornecedor';
   end else
   if rdgrpMovim.ItemIndex = 1 then
   begin
      dtmRelOperCaf.ppLabel118.Caption           := 'Saídas';
      dtmRelOperCaf.rpMovAnaPerDBCalc2.DataField := 'VALCTB';
      dtmRelOperCaf.rpMovAnaPerDBCalc3.DataField := 'VALCTB';
      dtmRelOperCaf.rpMovAnaPerDBText4.DataField := 'VALCTB';
      dtmRelOperCaf.rpMovAnaPerLabel5.Caption    := 'Saldo Contábil';
      dtmRelOperCaf.rpMovAnaPerDBText5.DataField := 'NOMEDESTIN';
      dtmRelOperCaf.rpMovAnaPerLabel6.Caption    := 'Destinatário';
   end else
   begin
      dtmRelOperCaf.ppLabel118.Caption           := 'Transferências';
      dtmRelOperCaf.rpMovAnaPerDBCalc2.DataField := 'VALCTB';
      dtmRelOperCaf.rpMovAnaPerDBCalc3.DataField := 'VALCTB';
      dtmRelOperCaf.rpMovAnaPerDBText4.DataField := 'VALCTB';
      dtmRelOperCaf.rpMovAnaPerLabel5.Caption    := 'Saldo Contábil';
      dtmRelOperCaf.rpMovAnaPerDBText5.DataField := 'DESCLOCALANT';
      dtmRelOperCaf.rpMovAnaPerLabel6.Caption    := 'Local Origem';
   end;
   //-------------------------------------------------------------------------------------
   with dtmRelOperCaf do
   begin
      qryMovAnaPer.Open;
      Screen.Cursor := crDefault;
      if qryMovAnaPer.IsEmpty then
         MsgDlg('Não existe Movimentação de Bens no periodo fornecido.',
                'Erro',mtError,[mbOk],0);
      //----------------------------------------------------------------------------------
      // Calcula os saldos contábeis nas respectivas datas fornecidas e registra no campo
      // virtual VALCTB, caso seja solicitado
      //----------------------------------------------------------------------------------
      if rdgrpMovim.ItemIndex > 0 then
      begin
         while not qryMovAnaPer.EOF do
         begin
            qrySldCtb.Close;
            //----------------------------------------------------------------------------
            if rdgrpMovim.ItemIndex = 1 then                               // Baixa de Bem
               qrySldCtb.ParamByName('PDATASLD').AsDateTime := qryMovAnaPer.FieldByName('DATAMOVIMENTACAO').AsDateTime - 1
            else
               qrySldCtb.ParamByName('PDATASLD').AsDateTime := qryMovAnaPer.FieldByName('DATAMOVIMENTACAO').AsDateTime;
            //----------------------------------------------------------------------------
            qrySldCtb.ParamByName('PIDBEM').AsInteger    := qryMovAnaPer.FieldByName('IDBEM').AsInteger;
            qrySldCtb.ParamByName('PIDPESSOA').AsInteger := qryMovAnaPer.FieldByName('IDPESSOA').AsInteger;
            qrySldCtb.Open;
            //----------------------------------------------------------------------------
            if not qrySldCtb.IsEmpty then
            begin
               qryMovAnaPer.Edit;
               qryMovAnaPer.FieldByName('VALCTB').AsCurrency := qrySldCtb.FieldByName('VALCTB').AsCurrency;
               qryMovAnaPer.Post;
            end;
            //----------------------------------------------------------------------------
            qryMovAnaPer.Next;
         end;
         qryMovAnaPer.First;
      end;
   end;
end;
//========================================================================================
procedure TfrmParamMovAnaPer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qrySldCtb.Close;
   qrySldCtb.UnPrepare;
end;

end.

