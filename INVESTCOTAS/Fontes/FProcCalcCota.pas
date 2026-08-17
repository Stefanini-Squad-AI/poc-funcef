unit FProcCalcCota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, Mask, DBCtrls, fcLabel, CmEventosCadastro, uCmControlObject,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  uCmSqlParams, Menus, Db, Wwdatsrc, DBClient, uCMClientDataSet, TREdit,
  Grids, Wwdbigrd, Wwdbgrid, uCMTypes, uCtrlHistCota, uCtrlPadroes, uMensErro,
  uCtrlParamCotaInvest, uCtrlCarteiraXEvento, uCtrlDiasUteis, DBGrids;

type
  TFrmProcCalcCota = class(TfrmOkCancelar)
    CmeCadastroAtivo: TCmEventosCadastro;
    CmeCadastroPassivo: TCmEventosCadastro;
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    PnlCab: TPanel;
    DbeCarteira: TDBEdit;
    DbeData: TDBEdit;
    PnlAtivoPassivo: TPanel;
    PnlPassivo: TPanel;
    PnlDetAtivo: TPanel;
    PnlAtivo: TPanel;
    PnlDetPassivo: TPanel;
    CdsAux: TCMClientDataSet;
    dsAtivo: TwwDataSource;
    CdsAtivo: TCMClientDataSet;
    CdsAtivoDESCCAIXACOTA: TStringField;
    CdsAtivoVLRHISTCOTA: TFloatField;
    CdsAtivoIDHISTCOTA: TFloatField;
    CdsAtivoIDCARTEIRAXEVENTO: TFloatField;
    CdsAtivoIDPLANPREVCTBPATR: TFloatField;
    CdsAtivoDATAHISTCOTA: TDateTimeField;
    CdsAtivoIDCARTEIRAINVEST: TFloatField;
    CdsAtivoIDCARTEIRAGERENC: TFloatField;
    CdsAtivoSTAATIVOPASSIVO: TStringField;
    CdsAtivoIDTIPOOPERACAO: TFloatField;
    CdsAtivoIDTIPOINVEST: TFloatField;
    CdsAtivoIDREGRA: TFloatField;
    CdsAtivoIDTIPODESPINVEST: TFloatField;
    CdsAtivoDESCCARTINVEST: TStringField;
    pmnuAltPassivo: TPopupMenu;
    mnuAltP: TMenuItem;
    CMSqlParams: TCMSqlParams;
    CdsCarteira: TCMClientDataSet;
    dsPassivo: TwwDataSource;
    CdsPassivo: TCMClientDataSet;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    DateTimeField1: TDateTimeField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    StringField2: TStringField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    StringField3: TStringField;
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DbRValor: TDBRealEdit;
    DBRealEdit1: TDBRealEdit;
    DBRealEdit2: TDBRealEdit;
    pmnuAltAtivo: TPopupMenu;
    mnuALtA: TMenuItem;
    CdsApCota: TCMClientDataSet;
    Label4: TLabel;
    DbrVlrAtivo: TDBRealEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DbrVlrPassivo: TDBRealEdit;
    DbeEventoAtivo: TDBEdit;
    DbeEventoPassivo: TDBEdit;
    DbrVlrCota: TDBRealEdit;
    DbrQtdCota: TDBRealEdit;
    DbrVlrPLFinal: TDBRealEdit;
    ePatrLiq: TEdit;
    eQtdCotas: TEdit;
    eVlrCota: TEdit;
    CdsTotalPassivo: TCMClientDataSet;
    CdsTotalAtivo: TCMClientDataSet;
    CdsBuscaEvAuto: TCMClientDataSet;
    dbGrdAtivo: TwwDBGrid;
    dbGrdPassivo: TwwDBGrid;
    pnlCotas: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    DbrVlrResg: TDBRealEdit;
    DbrVlrEmit: TDBRealEdit;
    Edit3: TEdit;
    DbrVlrPL: TDBRealEdit;
    procedure dbGrdAtivoDblClick(Sender: TObject);
    procedure CmeCadastroAtivoAtualizaBotoes(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbGrdPassivoDblClick(Sender: TObject);
    procedure dbGrdAtivoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbGrdPassivoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure pmnuAltAtivoPopup(Sender: TObject);
    procedure pmnuAltPassivoPopup(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbGrdAtivoUpdateFooter(Sender: TObject);
    procedure dbGrdPassivoUpdateFooter(Sender: TObject);
  private
    { Private declarations }
    CtrlHistCota : TCtrlHistCota;
    CtrlParamCotaInvest : TCtrlParamCotaInvest;
    CtrlCarteiraXEvento : TCtrlCarteiraXEvento;
    CtrlDiasUteis : TCtrlDiasUteis;

    FCarteiraInvest: Integer;
    FDataCalc: TDateTime;

    procedure SetCarteiraInvest(const Value: Integer);
    procedure SetDataCalc(const Value: TDateTime);

  public
    { Public declarations }
    property DataCalc : TDateTime read FDataCalc write SetDataCalc;
    property CarteiraInvest : Integer read FCarteiraInvest write SetCarteiraInvest;

    procedure Sel;

    procedure AtualizaTela;
    
  end;

var
  FrmProcCalcCota: TFrmProcCalcCota;

implementation

{$R *.DFM}

procedure TFrmProcCalcCota.dbGrdAtivoDblClick(Sender: TObject);
begin
  inherited;
   if not CdsAtivo.IsEmpty then
   begin
      if not (CdsAtivo.State in [DsEdit]) then
         CdsAtivo.Cancel;

      CdsAtivo.Edit;
      CmeCadastroAtivo.AtualizaBotoes(Self);
      dbGrdAtivo.Visible := False;
   end;
end;

procedure TFrmProcCalcCota.CmeCadastroAtivoAtualizaBotoes(Sender: TObject);
begin
   inherited;
    bbtnConfirmar.Enabled := ((CdsAtivo.State in [DsEdit]) or (CdsPassivo.State in [DsEdit]));
    bbtnCancelar.Enabled  := ((CdsAtivo.State in [DsEdit]) or (CdsPassivo.State in [DsEdit]));
end;

procedure TFrmProcCalcCota.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlHistCota := TCtrlHistCota.Create;
   CtrlHistCota.InitializeAs(Padroes);
   CtrlHistCota.CdsAtivo   := CdsAtivo;
   CtrlHistCota.CdsPassivo := CdsPassivo;

   CtrlParamCotaInvest := TCtrlParamCotaInvest.Create;
   CtrlParamCotaInvest.InitializeAs(Padroes);

   CtrlCarteiraXEvento := TCtrlCarteiraXEvento.Create;
   CtrlCarteiraXEvento.InitializeAs(Padroes);

   CtrlDiasUteis := TCtrlDiasUteis.Create;
   CtrlDiasUteis.InitializeAs(Padroes);

   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
end;

procedure TFrmProcCalcCota.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   if not (CdsAtivo.State in [DsEdit]) then
      CdsAtivo.Cancel;

   if not (CdsPassivo.State in [DsEdit]) then
      CdsPassivo.Cancel;

   AtualizaTela;

   CmeCadastroAtivo.AtualizaBotoes(Self);

   dbGrdAtivo.Visible   := True;
   dbGrdPassivo.Visible := True;
end;

procedure TFrmProcCalcCota.dbGrdPassivoDblClick(Sender: TObject);
begin
  inherited;
   if not CdsPassivo.IsEmpty then
   begin
      if not (CdsPassivo.State in [DsEdit]) then
         CdsPassivo.Cancel;

      CdsPassivo.Edit;
      CmeCadastroAtivo.AtualizaBotoes(Self);
      dbGrdPassivo.Visible := False;
   end;
end;

procedure TFrmProcCalcCota.dbGrdAtivoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // amarelo bebê
        end else begin
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;

procedure TFrmProcCalcCota.dbGrdPassivoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // amarelo bebê
        end else begin
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;

procedure TFrmProcCalcCota.bbtnConfirmarClick(Sender: TObject);
var bModif : Boolean;
begin
   bModif := False;
  inherited;
   try
      try
         if not CdsAtivo.IsEmpty then
         begin
            if (CdsAtivo.State in [DsEdit]) then
            begin
               CdsAtivo.Post;
               bModif := True;
            end;
         end;

         if not CdsPassivo.IsEmpty then
         begin
            if (CdsPassivo.State in [DsEdit]) then
            begin
               CdsPassivo.Post;
               bModif := True;
            end;
         end;

         if bModif then
         begin
            if not CtrlHistCota.AplicaAtualAtivoPassivo then
               Raise Exception.Create('Ocorreu um erro na gravação do Registro.' + #13 +
                                      'Motivo: ' + CtrlHistCota.MessageInfo);

            if not CtrlHistCota.ApuraCalculoCota(FDataCalc, FCarteiraInvest) then
               Raise Exception.Create('Ocorreu um erro na apuração do cálculo de cota.' + #13 +
                                      'Motivo: ' + CtrlHistCota.MessageInfo);
         end;
         
         if not CtrlParamCotaInvest.AtualizaDataFech(FCarteiraInvest, FDataCalc) then
            Raise Exception.Create('Ocorreu um erro na atualização da data de fechamento.' + #13 +
                                   'Motivo: ' + CtrlParamCotaInvest.MessageInfo);
      except
         on E:Exception do
            MsgDlg(E.Message,'Erro',mtError,[mbOk],0);
      end;
   finally
      AtualizaTela;

      CmeCadastroAtivo.AtualizaBotoes(Self);

      dbGrdAtivo.Visible   := True;
      dbGrdPassivo.Visible := True;
   end;
end;

procedure TFrmProcCalcCota.SetCarteiraInvest(const Value: Integer);
begin
   FCarteiraInvest := Value;
end;

procedure TFrmProcCalcCota.SetDataCalc(const Value: TDateTime);
begin
   FDataCalc := Value;
end;

procedure TFrmProcCalcCota.Sel;
var iIdCartXEven : Integer;
begin
   try
      iIdCartXEven := CtrlCarteiraXEvento.BuscaIdCarteiraXEvento(-2, FCarteiraInvest);

      if iIdCartXEven <= 0 then
         Raise Exception.Create('Não foi cadastrado o evento "Saldo Atual"(-2) para a Carteira.');

      CdsAux.Data := CtrlHistCota.ListHistCota(-1,'','',FDataCalc,FCarteiraInvest);

      if not CdsAux.Locate('IDCARTEIRAXEVENTO',iIdCartXEven,[]) then
         Raise Exception.Create('Não foi efetuada "Apuração de Caixa" para a Carteira.');

      CdsAtivo.Data   := CtrlHistCota.ListHistCota(-1,'A','S',FDataCalc,FCarteiraInvest);
      CdsPassivo.Data := CtrlHistCota.ListHistCota(-1,'P','S',FDataCalc,FCarteiraInvest);

      CdsTotalAtivo.Data   := CtrlHistCota.ListTotalCota(-1,'A','S',FDataCalc,FCarteiraInvest);
      CdsTotalPassivo.Data := CtrlHistCota.ListTotalCota(-1,'P','S',FDataCalc,FCarteiraInvest);

      CdsApCota.Data  := CtrlHistCota.ListApuraCota(FDataCalc,FCarteiraInvest);

      if ((CdsApCota.IsEmpty) or (MsgDlg('Deseja atualizar a cota?', 'Atualização', mtConfirmation, [mbYes,mbNo],0) = mrYes)) then
      begin
         if not CtrlHistCota.AlimentaEventoAuto(FDataCalc,FCarteiraInvest) then
            Raise Exception.Create('Ocorreu um erro na alimenta evento automático.' + #13 + 'Motivo: ' + CtrlHistCota.MessageInfo);

         if not CtrlHistCota.ApuraCalculoCota(FDataCalc,FCarteiraInvest) then
            Raise Exception.Create('Ocorreu um erro na apuração do cálculo de cota.' + #13 + 'Motivo: ' + CtrlHistCota.MessageInfo);

         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
      end;

      AtualizaTela;
   except
      on E:Exception do
         MsgDlg(E.Message,'Erro',mtError,[mbOk],0);
   end;
end;

procedure TFrmProcCalcCota.pmnuAltAtivoPopup(Sender: TObject);
begin
  inherited;
   mnuALtA.Enabled := (not CdsAtivo.IsEmpty);
end;

procedure TFrmProcCalcCota.pmnuAltPassivoPopup(Sender: TObject);
begin
  inherited;
   mnuAltP.Enabled := (not CdsPassivo.IsEmpty);
end;

procedure TFrmProcCalcCota.FormDestroy(Sender: TObject);
begin
  inherited;
   FreeAndNil(CtrlCarteiraXEvento);
   FreeAndNil(CtrlParamCotaInvest);
   FreeAndNil(CtrlHistCota);
   FreeAndNil(CtrlDiasUteis);
end;

procedure TFrmProcCalcCota.dbGrdAtivoUpdateFooter(Sender: TObject);
begin
  inherited;
   if not CdsTotalAtivo.IsEmpty then
   begin
      dbGrdAtivo.Columns[0].FooterValue  := 'TOTAL';
      dbGrdAtivo.Columns[1].FooterValue  := FormatFloat('#,##0.00',CdsTotalAtivo.FieldByName('VLRTOTAL').AsFloat);
   end;
end;

procedure TFrmProcCalcCota.dbGrdPassivoUpdateFooter(Sender: TObject);
begin
  inherited;
   if not CdsTotalPassivo.IsEmpty then
   begin
      dbGrdPassivo.Columns[0].FooterValue  := 'TOTAL';
      dbGrdPassivo.Columns[1].FooterValue  := FormatFloat('#,##0.00',CdsTotalPassivo.FieldByName('VLRTOTAL').AsFloat);
   end;
end;

procedure TFrmProcCalcCota.AtualizaTela;
begin
   CdsTotalAtivo.Data   := CtrlHistCota.ListTotalCota(-1,'A','S',FDataCalc,FCarteiraInvest);
   CdsTotalPassivo.Data := CtrlHistCota.ListTotalCota(-1,'P','S',FDataCalc,FCarteiraInvest);

   CdsAtivo.Data   := CtrlHistCota.ListHistCota(-1,'A','S',FDataCalc,FCarteiraInvest);
   CdsPassivo.Data := CtrlHistCota.ListHistCota(-1,'P','S',FDataCalc,FCarteiraInvest);

   CdsApCota.Data  := CtrlHistCota.ListApuraCota(FDataCalc,FCarteiraInvest);

   CdsAux.Data     := CtrlParamCotaInvest.ListParamCotaInvest(-1,FCarteiraInvest);

   DbrQtdCota.DecDigits :=  CdsAux.FieldByName('QTDDECQTD').AsInteger;
   DbrVlrCota.DecDigits :=  CdsAux.FieldByName('QTDDECVLR').AsInteger;
   while not CdsApCota.eof do
   begin
      if CdsApCota.FieldByName('IDEVENTOCAIXACOTA').AsInteger = -3 then
         DbrVlrPLFinal.Value := CdsApCota.FieldByName('VLRHISTCOTA').AsFloat
      else if CdsApCota.FieldByName('IDEVENTOCAIXACOTA').AsInteger = -4 then
         DbrQtdCota.Value := CdsApCota.FieldByName('VLRHISTCOTA').AsFloat
      else if CdsApCota.FieldByName('IDEVENTOCAIXACOTA').AsInteger = -5 then
         DbrVlrCota.Value := CdsApCota.FieldByName('VLRHISTCOTA').AsFloat
      else if CdsApCota.FieldByName('IDEVENTOCAIXACOTA').AsInteger = -16 then
         DbrVlrEmit.Value := CdsApCota.FieldByName('VLRHISTCOTA').AsFloat
      else if CdsApCota.FieldByName('IDEVENTOCAIXACOTA').AsInteger = -17 then
         DbrVlrResg.Value := CdsApCota.FieldByName('VLRHISTCOTA').AsFloat
      else if CdsApCota.FieldByName('IDEVENTOCAIXACOTA').AsInteger = -18 then
         DbrVlrPL.Value := CdsApCota.FieldByName('VLRHISTCOTA').AsFloat;
      CdsApCota.Next;
   end;
end;

end.
