unit FParamFlashRpt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ExtCtrls, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, Db, DBTables, Wwquery, wwdblook,
  ComCtrls, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamFlashRpt = class(TfrmOkCancelar)
    Refer6encia: TGroupBox;
    Label1: TLabel;
    deDataRef: TCMDateTimePicker;
    Label2: TLabel;
    dbOrigem: TwwDBLookupCombo;
    qryOrigem: TwwQuery;
    Label3: TLabel;
    Label4: TLabel;
    qryOrigemIDORIGEM: TFloatField;
    qryOrigemDESCRICAO: TStringField;
    qryOrigemCODREDUZIDO: TStringField;
    Comentatios: TGroupBox;
    memoObs: TMemo;
    pbRelat: TProgressBar;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbOrigemEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

const USOCASA   = 'U';
      CORTESIA  = 'C';
      NGRATUITO = 'N';
      PERMUTA   = 'P';
var
  frmParamFlashRpt: TfrmParamFlashRpt;

implementation

uses uMODULO, uMensErro, uSistema, uFlashRpt;

{$R *.DFM}

procedure TfrmParamFlashRpt.bbtnConfirmarClick(Sender: TObject);
var DataIni , DataFim : TDateTime;
    Year, Month, Day : Word;
    DataAval, DataForeIni, DataForeFim : TDateTime;
    rValorHoje, rValorAcum, rValorOrc : Double;
begin
  inherited;
  Year    := 0;
  Month   := 0;
  Day     := 0;
  rValorHoje := 0;
  rValorAcum := 0;
  rValorOrc  := 0;

  if (trim(dbOrigem.Text) = '') then
  begin
    MsgDlg('Informe a origem de reserva Choice RS.',LerMensagem(2),mtError,[mbOk],0);
    ModalResult := mrNone;
    dbOrigem.SetFocus;
    Exit;
  end;

  try
    DataAval := StrToDateTime(deDataRef.Text);
    if DataAval > Modulo.dDataSistema - 1 then
    begin
      MsgDlg('Data de avaliação não pode ser maior que data da última auditoria.',
             LerMensagem(2),mtError,[mbOk],0);
      ModalResult := mrNone;
      deDataRef.Text := FormatDateTime('dd/mm/yyyy', Modulo.dDataSistema - 1);
      deDataRef.SetFocus;
      Exit;
    end;

    DecodeDate(DataAval, Year, Month, Day);
    DataIni := StrToDateTime('01/'+FormatFloat('00',Month)+'/'+FormatFloat('00',Year));
    DataFim := DataAval + 1;

    // Datas do 4 Day ForeCast
    DataForeIni := DataAval + 1;
    DataForeFim := DataAval + 5;

  except
    MsgDlg('Data inválida !',LerMensagem(2),mtError,[mbOk],0);
    ModalResult := mrNone;
    deDataRef.SetFocus;
    Exit;
  end;

  dtmFlashRpt.dDataRelat := DataAval;
  dtmFlashRpt.dDataRelatIni := DataIni;
  
  if memoObs.Lines.Count > 0 then
    dtmFlashRpt.sComments  := memoObs.Lines.Text
  else dtmFlashRpt.sComments  := '';

  pbRelat.Max := 20;
  pbRelat.Position := 0;

  with dtmFlashRpt.qryFlashRpt do
  begin
    Close;
    ParambyName('IDHOTEL').asinteger  := Modulo.iHotel;
    Open;
  end;

  with dtmFlashRpt.qryEmpresaProp do
  begin
    Close;
    ParambyName('pEMPRESA').asinteger  := Modulo.IdEmpresa;
    Open;
  end;
  pbRelat.Position := pbRelat.Position + 1;
  Application.ProcessMessages;
    
  with dtmFlashRpt.qryComplimentary do
  begin
    Close;
    ParambyName('DATAHOJE').AsDateTime := DataAval;
    ParambyName('TIPO').AsString := CORTESIA;
    ParambyName('IDHOTEL').AsInteger  := Modulo.iHotel;
    Open;
  end;
  pbRelat.Position := pbRelat.Position + 1;
  Application.ProcessMessages; 

  with dtmFlashRpt.qryHouseUse do
  begin
    Close;
    ParambyName('DATAHOJE').AsDateTime := DataAval;
    ParambyName('TIPO').AsString := USOCASA;
    ParambyName('IDHOTEL').AsInteger  := Modulo.iHotel;
    Open;
  end;
  pbRelat.Position := pbRelat.Position + 1;
  Application.ProcessMessages;

  with dtmFlashRpt.qryOutOrder do
  begin
    Close;
    ParambyName('DATA').AsDateTime    := DataAval;
    ParambyName('IDHOTEL').AsInteger  := Modulo.iHotel;
    Open;
  end;
  pbRelat.Position := pbRelat.Position + 1;
  Application.ProcessMessages;

  with dtmFlashRpt.qryOcupacaoGrp do
  begin
    Close;
    ParambyName('DATAINI').AsDateTime := DataForeIni;
    ParambyName('DATAFIM').AsDateTime := DataForeFim;
    ParambyName('IDHOTEL').AsInteger  := Modulo.iHotel;
    Open;
  end;
  pbRelat.Position := pbRelat.Position + 1;
  Application.ProcessMessages;

  with dtmFlashRpt.qryOcupacao do
  begin
    Close;
    ParambyName('DATAINI').AsDateTime := DataForeIni;
    ParambyName('DATAFIM').AsDateTime := DataForeFim;
    ParambyName('IDHOTEL').AsInteger  := Modulo.iHotel;
    Open;
  end;
  pbRelat.Position := pbRelat.Position + 1;
  Application.ProcessMessages;

  with dtmFlashRpt.qryBloq do
  begin
    Close;
    ParambyName('DATAINI').AsDateTime := DataForeIni;
    ParambyName('DATAFIM').AsDateTime := DataForeFim;
    ParambyName('IDHOTEL').AsInteger  := Modulo.iHotel;
    Open;
  end;
  pbRelat.Position := pbRelat.Position + 1;
  Application.ProcessMessages;

  with dtmFlashRpt.qryAtuAllot do
  begin
    Close;
    ParambyName('DATAINI').AsDateTime := DataForeIni;
    ParambyName('DATAFIM').AsDateTime := DataForeFim;
    ParambyName('IDHOTEL').AsInteger  := Modulo.iHotel;
    Open;
  end;
  pbRelat.Position := pbRelat.Position + 1;
  Application.ProcessMessages;

  with dtmFlashRpt.qryQtdUHNPF do
  begin
    Close;
    ParambyName('DATA').AsDateTime := DataForeIni;
    ParambyName('IDHOTEL').asinteger  := Modulo.iHotel;
    Open;
  end;
  pbRelat.Position := pbRelat.Position + 1;
  Application.ProcessMessages;

  with dtmFlashRpt.qryCalResGrpTipoAllot do
  begin
    Close;
    ParambyName('DATAINI').AsDateTime := DataForeIni;
    ParambyName('DATAFIM').AsDateTime := DataForeFim;
    ParambyName('IDHOTEL').AsInteger  := Modulo.iHotel;
    Open;
  end;
  pbRelat.Position := pbRelat.Position + 1;
  Application.ProcessMessages;

  with dtmFlashRpt.qryQtdContrAllot do
  begin
    Close;
    ParambyName('DATAINI').AsDateTime := DataForeIni;
    ParambyName('DATAFIM').AsDateTime := DataForeFim;
    ParambyName('IDHOTEL').AsInteger  := Modulo.iHotel;
    Open;
  end;
  pbRelat.Position := pbRelat.Position + 1;
  Application.ProcessMessages;

  with dtmFlashRpt.qryQtdUHPF do
  begin
    Close;
    ParambyName('DATAINI').AsDateTime := DataForeIni;
    ParambyName('DATAFIM').AsDateTime := DataForeFim;
    ParambyName('IDHOTEL').AsInteger  := Modulo.iHotel;
    Open;
  end;
  pbRelat.Position := pbRelat.Position + 1;
  Application.ProcessMessages;

  with dtmFlashRpt.qryReceitas do
  begin
    Close;
    ParambyName('DATAINI').AsDateTime := DataForeIni;
    ParambyName('DATAFIM').AsDateTime := DataForeFim;
    ParambyName('IDHOTEL').Asinteger  := Modulo.iHotel;
    Open;
  end;
  pbRelat.Position := pbRelat.Position + 1;
  Application.ProcessMessages;

  with dtmFlashRpt.qryDatas do
  begin
    Close;
    ParambyName('DATAINI').AsDateTime := DataForeIni;
    ParambyName('DATAFIM').AsDateTime := DataForeFim;
    ParambyName('IDHOTEL').AsInteger  := Modulo.iHotel;
    Open;
  end;
  pbRelat.Position := pbRelat.Position + 1;
  Application.ProcessMessages;

  with dtmFlashRpt.qryEstatHotel do
  begin
    Close;
    ParambyName('DATAINI').AsDateTime := DataIni;
    ParambyName('DATAFIM').AsDateTime := DataFim;
    ParambyName('DATAHOJE').AsDateTime := DataAval;
    ParambyName('ORIGEM').AsInteger := qryOrigem.FieldByName('IDORIGEM').AsInteger;
    ParambyName('IDHOTEL').AsInteger  := Modulo.iHotel;
    Open;
  end;
  pbRelat.Position := pbRelat.Position + 1;
  Application.ProcessMessages;

  // ----- Couvert ------
  with dtmFlashRpt.qryCouvert do
  begin
    Close;
    ParambyName('DATAINI').AsDateTime  := DataIni;
    ParambyName('DATAFIM').AsDateTime  := DataFim;
    ParambyName('IDHOTEL').asinteger   := Modulo.iHotel;
    ParambyName('DATAHOJE').AsDateTime := DataAval;
    Open;
  end;

  with dtmFlashRpt.qryFoodStats do
  begin
    Close;
    ParambyName('DATAINI').AsDateTime  := DataIni;
    ParambyName('DATAFIM').AsDateTime  := DataFim;
    ParambyName('IDHOTEL').asinteger   := Modulo.iHotel;
    ParambyName('DATAHOJE').AsDateTime := DataAval;
    ParambyName('TXCONV').AsFloat      := 1;
    Open;
  end;

  dtmFlashRpt.qryCouvert.Close;

  // ------ --------------

  pbRelat.Position := pbRelat.Position + 1;
  Application.ProcessMessages;

  with dtmFlashRpt.qryRoomsDI do
  begin
    Close;
    ParambyName('DATAINI').AsDateTime   := DataIni;
    ParambyName('DATAFIM').AsDateTime   := DataFim;
    ParambyName('IDHOTEL').AsInteger    := Modulo.iHotel;
    ParambyName('DATAHOJE').AsDateTime  := DataAval;
    ParambyName('TXCONV').AsFloat       := 1;
    ParambyName('TOTUHHOJE').AsInteger  :=
      dtmFlashRpt.qryEstatHotel.FieldByName('TOTALUHSHOJE').AsInteger;
    ParambyName('TOTUHACUM').AsInteger  :=
      dtmFlashRpt.qryEstatHotel.FieldByName('TOTALUHS').AsInteger;
    ParambyName('UHOCUPHOJE').AsInteger :=
      dtmFlashRpt.qryEstatHotel.FieldByName('QTDEOCCUPIEDROOMSHOJE').AsInteger;
    ParambyName('UHOCUPACUM').AsInteger :=
      dtmFlashRpt.qryEstatHotel.FieldByName('QTDEOCCUPIEDROOMS').AsInteger;
    Open;
  end;

  pbRelat.Position := pbRelat.Position + 1;
  Application.ProcessMessages;

  with dtmFlashRpt do
  begin
    qryPOA.Close;
    qryLinhaPOA.Close;
    qryLinhaPOA.ParamByName('IDHOTEL').AsInteger := Modulo.iHotel;
    qryLinhaPOA.Open;
    qryPOA.Open;
    while not qryLinhaPOA.EOF do
    begin
      qryPOA.Edit;
      qryPOA.Fields[qryLinhaPOA.FieldByName('IDLINHARELAT').AsInteger].AsFloat :=
        CalculaOrcElemento(qryLinhaPOA.FieldByName('IDELEMDEMONSTRAT').AsInteger,
                           qryLinhaPOA.FieldByName('FLGRATEIO').AsString);
      qryPOA.Post;
      qryLinhaPOA.Next;
    end;
    qryLinhaPOA.Close;
    qryPOA.First;
  end;

  pbRelat.Position := pbRelat.Position + 1;
  Application.ProcessMessages;

  with dtmFlashRpt do
  begin
    qryLinhaDeptRev.Close;
    qryLinhaDeptRev.ParamByName('IDHOTEL').AsInteger := Modulo.iHotel;
    qryLinhaDeptRev.Open;
    while not qryLinhaDeptRev.EOF do
    begin
      qryItemDeptRev.Close;
      qryItemDeptRev.ParamByName('IDGRUPODEPTREV').AsInteger :=
        qryLinhaDeptRev.FieldByName('IDGRUPODEPTREV').AsInteger;
      qryItemDeptRev.Open;

      qryLinhaDeptRev.Edit;

      while not qryItemDeptRev.EOF do
      begin
        if (qryItemDeptRev.FieldByName('COLUNA').AsString = 'A') then
          qryLinhaDeptRev.FieldByName('COLACUMULADO').AsFloat :=
            qryLinhaDeptRev.FieldByName('COLACUMULADO').AsFloat +
            CalculaAcumElemento(qryItemDeptRev.FieldByName('IDELEMDEMONSTRAT').AsInteger,
                                qryItemDeptRev.FieldByName('FLGRATEIO').AsString);

        if (qryItemDeptRev.FieldByName('COLUNA').AsString = 'H') then
          qryLinhaDeptRev.FieldByName('COLHOJE').AsFloat :=
            qryLinhaDeptRev.FieldByName('COLHOJE').AsFloat +
            CalculaHojeElemento(qryItemDeptRev.FieldByName('IDELEMDEMONSTRAT').AsInteger,
                                qryItemDeptRev.FieldByName('FLGRATEIO').AsString);

        if (qryItemDeptRev.FieldByName('COLUNA').AsString = 'O') then
          qryLinhaDeptRev.FieldByName('COLORCADO').AsFloat :=
            qryLinhaDeptRev.FieldByName('COLORCADO').AsFloat +
            CalculaOrcElemento(qryItemDeptRev.FieldByName('IDELEMDEMONSTRAT').AsInteger,
                               qryItemDeptRev.FieldByName('FLGRATEIO').AsString);

        qryItemDeptRev.Next;
      end;

      qryLinhaDeptRev.Post;

      rValorHoje := rValorHoje + qryLinhaDeptRev.FieldByName('COLHOJE').AsFloat;
      rValorAcum := rValorAcum + qryLinhaDeptRev.FieldByName('COLACUMULADO').AsFloat;
      rValorOrc  := rValorOrc  + qryLinhaDeptRev.FieldByName('COLORCADO').AsFloat;

      qryLinhaDeptRev.Next;
    end;
    qryItemDeptRev.Close;
    qryLinhaDeptRev.First;
  end;

  pbRelat.Position := pbRelat.Position + 1;
  Application.ProcessMessages;
  
  with dtmFlashRpt do
  begin
    qryNetRev.Close;
    qryNetRev.Open;
    qryNetRev.Edit;
    qryNetRev.FieldByName('NETREVHOJE').AsFloat := rValorHoje;
    qryNetRev.FieldByName('NETREV').AsFloat := rValorAcum;
    qryNetRev.FieldByName('NETREVORC').AsFloat := rValorOrc;
    if qryEstatHotel.FieldByName('TOTALUHSHOJE').AsInteger > 0 then
      qryNetRev.FieldByName('REVPARHOJE').AsFloat :=
        rValorHoje / qryEstatHotel.FieldByName('TOTALUHSHOJE').AsInteger
    else qryNetRev.FieldByName('REVPARHOJE').AsFloat := 0;
    if qryEstatHotel.FieldByName('TOTALUHS').AsInteger > 0 then
      qryNetRev.FieldByName('REVPAR').AsFloat :=
        rValorAcum / qryEstatHotel.FieldByName('TOTALUHS').AsInteger
    else qryNetRev.FieldByName('REVPAR').AsFloat := 0;
    if qryPOA.FieldByName('TOTALUHS').AsInteger > 0 then
      qryNetRev.FieldByName('REVPARORC').AsFloat :=
        rValorOrc / qryPOA.FieldByName('TOTALUHS').AsInteger
    else qryNetRev.FieldByName('REVPARORC').AsFloat := 0;
    qryNetRev.Post;
    qryNetRev.First;
  end;

  pbRelat.Position := pbRelat.Position + 1;
  Application.ProcessMessages;
  pbRelat.Position := 0;
end;

procedure TfrmParamFlashRpt.FormShow(Sender: TObject);
begin
  inherited;
  deDataRef.Text := FormatDateTime('dd/mm/yyyy', Modulo.dDataSistema - 1);
end;

procedure TfrmParamFlashRpt.dbOrigemEnter(Sender: TObject);
begin
  inherited;
  with qryOrigem do
    if not Active then Open;
end;

procedure TfrmParamFlashRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryOrigem.Close;
  inherited;
end;

end.
