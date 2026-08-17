// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : - ( SqlChequeOriginal )
Data      : 30/06/2003
Autor     : André Pontes
Descrição : Retirada a obrigatoriedade do arquivo de remessa para cheques:
            --   AND ( CODARQUIVOREMESSA IS NOT NULL )
---------------------------------------------------------------------------------------------------}

unit FRelEmisCheque;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBTables, Wwquery,
   IvDictio, IvMulti, IvEMulti, fcLabel, wwdblook, CMDBLookupCombo, EditReg,
   TB97, wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams, DBClient,
   uCMClientDataSet, fParamReports_Padrao, CmParamReport;

type
   TFrmRelEmisCheque = class(TfrmParamReports_Padrao)
      DsCheque: TwwDataSource;
      RgRemessa: TRadioGroup;
      BBtnSelecionar: TBitBtn;
      Panel2: TPanel;
      Panel1: TPanel;
      PnlTotaVenc: TPanel;
      SbAdTodos: TBitBtn;
      SbAdInverte: TBitBtn;
      Panel4: TPanel;
      CdsCheque: TCMClientDataSet;
      SqlCheque: TCMSqlParams;
      SqlTodos: TCMSqlParams;
      CdsTodos: TCMClientDataSet;
      SqlAlteradores: TCMSqlParams;
      CdsAlteradores: TCMClientDataSet;
      SqlOP: TCMSqlParams;
      CdsOP: TCMClientDataSet;
      SqlIntBanco: TCMSqlParams;
      CdsIntBanco: TCMClientDataSet;
      SqlChequeOriginal: TCMSqlParams;
      GpFaixa: TGroupBox;
      Label1: TLabel;
      DtIni: TCMDateTimePicker;
      DtFin: TCMDateTimePicker;
      GrdDocsaVencer: TwwDBGrid;
      CdsChequeNUMLOTE: TFloatField;
      CdsChequeDATAEMISSAO: TDateTimeField;
      CdsChequeNUMCHQBORDERO: TStringField;
      CdsChequeFAVORECIDO: TStringField;
      CdsChequeSUMLDVALOR: TFloatField;
      CdsChequeEMITE: TFloatField;

      procedure BBtnSelecionarClick(Sender: TObject);
      procedure SbAdTodosClick(Sender: TObject);
      procedure SbAdInverteClick(Sender: TObject);
      procedure GrdDocsaVencerCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure RgRemessaClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);

   private  // Private declarations

      sNumSlip: string;

   public   // Public declarations

   end;



var
  FrmRelEmisCheque: TFrmRelEmisCheque;



implementation
{$R *.DFM}
uses uSistema, uFuncaoGeral;



procedure TFrmRelEmisCheque.BBtnSelecionarClick(Sender: TObject);
begin
   inherited;

   case RgRemessa.ItemIndex of
     0: SqlCheque.SQL.Text := SqlTodos.SQL.Text;
     1: SqlCheque.SQL.Text := SqlChequeOriginal.SQL.Text;
     2: SqlCheque.SQL.Text := SqlIntBanco.SQL.Text;
     3: SqlCheque.SQL.Text := SqlOp.SQL.Text;
   end;

   if (DtIni.Text <> '') and (DtFin.Text <> '') then
   begin
      if not(SqlCheque.Prepared) then SqlCheque.Prepare;

      CdsCheque.Close;

      if RgRemessa.ItemIndex = 3 then
      begin
         if InputQuery('Seleciona Lote', 'Entre Com o Nº da Ordem de Pagamento', sNumSlip) then
         begin
            sNumSlip := Trim(sNumSlip);
            if (sNumSlip = '0') or (sNumslip = '') then Exit;

            SqlCheque.ParamByName('IDUSUARIO').AsFloat := Sistema.idusuario;
            SqlCheque.ParamByName('NUMSLIP').AsString  := sNumSlip;
         end
         else
         begin
            Exit;
         end;
      end
      else
      begin
         SqlCheque.Parambyname('PDATAINI').AsDateTime := StrToDate(DtIni.Text);
         SqlCheque.Parambyname('PDATAFIM').AsDateTime := StrToDate(DtFin.Text);
         SqlCheque.Parambyname('PIDPESSOA').AsInteger := Sistema.IDEmpresa;
         SqlCheque.Parambyname('IDUSUARIO').AsInteger := Sistema.IDUsuario;
      end;

      SqlCheque.Open;
      PnlTotaVenc.Enabled := not CdsCheque.IsEmpty;

      if RgRemessa.ItemIndex = 3 then
      begin
         SbAdTodos.Click;
         GrdDocsaVencer.ReadOnly := True
      end
      else
      begin
         GrdDocsaVencer.ReadOnly := False;
      end;
   end;
end;



procedure TFrmRelEmisCheque.SbAdTodosClick(Sender: TObject);
begin
   inherited;
   CdsCheque.First;

   while not(CdsCheque.EOF) do
   begin
      CdsCheque.Edit;
      CdsCheque.FieldByName('EMITE').AsString := '1';
      CdsCheque.Post;
      CdsCheque.Next;
   end;
   CdsCheque.First;
end;



procedure TFrmRelEmisCheque.SbAdInverteClick(Sender: TObject);
begin
   inherited;

   CdsCheque.First;
   while not(CdsCheque.EOF) do
   begin
      CdsCheque.Edit;
      if CdsCheque.FieldByName('EMITE').AsString = '1' then
      begin
         CdsCheque.FieldByName('EMITE').AsString := '0';
      end
      else
      begin
         CdsCheque.FieldByName('EMITE').AsString := '1';
      end;
      CdsCheque.Post;
      CdsCheque.Next;
   end;
   CdsCheque.First;
end;



procedure TFrmRelEmisCheque.GrdDocsaVencerCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   if (Field.FieldName = 'EMITE') then ABrush.Color := $0080FFFF;
end;



procedure TFrmRelEmisCheque.bbtnConfirmarClick(Sender: TObject);
var
   sLista: string;
begin
   inherited;
   sLista := '';
   if not(CdsCheque.IsEmpty) then
   begin
      CdsCheque.First;
      while not CdsCheque.Eof do
      begin
        if CdsCheque.FieldByName('EMITE').AsString = '1' then sLista := sLista + CdsCheque.FieldByName('NUMLOTE').AsString + ',';
        CdsCheque.Next;
      end;
      sLista := Copy(sLista, 1, Length(sLista) - 1);
   end;
   Cmp_Padrao.ParamValues[0].AsString := sLista;
end;



procedure TFrmRelEmisCheque.RgRemessaClick(Sender: TObject);
begin
   inherited;
   if DsCheque.DataSet.Active then DsCheque.DataSet.Close;
   PnlTotaVenc.Enabled := (RgRemessa.ItemIndex <> 3);
end;



procedure TFrmRelEmisCheque.FormCreate(Sender: TObject);
begin
   inherited;
   DtIni.Date := Date;
   DtFin.Date := Date;
end;



end.

