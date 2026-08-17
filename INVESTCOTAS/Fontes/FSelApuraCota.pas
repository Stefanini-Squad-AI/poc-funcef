unit FSelApuraCota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, wwdblook, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  Db, DBClient, uCMClientDataSet, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, uCtrlPadroes, uCtrlParamCotaInvest,
  Wwdatsrc, uCmSqlParams, uMensErro, FCadastroGridMTInv;

type
  TFrmSelApuraCota = class(TfrmOkCancelarInv)
    CdsCarteira: TCMClientDataSet;
    Label6: TLabel;
    dbdData: TCMDateTimePicker;
    Label2: TLabel;
    DbLcCarteira: TwwDBLookupCombo;
    CMSqlParams: TCMSqlParams;
    ds: TwwDataSource;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DbLcCarteiraExit(Sender: TObject);
    procedure DbLcCarteiraCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    CtrlParamCotaInvest : TCtrlParamCotaInvest;
    FCarteiraInvest: Integer;
    FDataCalc: TDateTime;
    procedure SetCarteiraInvest(const Value: Integer);
    procedure SetDataCalc(const Value: TDateTime);

  public
    { Public declarations }
    property DataCalc : TDateTime read FDataCalc write SetDataCalc;
    property CarteiraInvest : Integer read FCarteiraInvest write SetCarteiraInvest;
  end;

var
  FrmSelApuraCota: TFrmSelApuraCota;

implementation

uses FProcCalcCaixa, UDiasUteisInvest, FTelaAut;

{$R *.DFM}

procedure TFrmSelApuraCota.bbtnConfirmarClick(Sender: TObject);
begin
   if Trim(DbLcCarteira.Text) = '' then
   begin
      MsgDlg('Informe a Carteira.', 'Warning', mtWarning, [mbOk], 0);
      if DbLcCarteira.CanFocus then
         DbLcCarteira.SetFocus;
      Exit;
   end;

   if Trim(dbdData.Text) = '' then
   begin
      MsgDlg('Informe a Data.', 'Warning', mtWarning, [mbOk], 0);
      if dbdData.CanFocus then
         dbdData.SetFocus;
      Exit;
   end;

  inherited;

  FCarteiraInvest := StrToInt(DbLcCarteira.LookupValue);

  FDataCalc := dbdData.Date;

end;

procedure TFrmSelApuraCota.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   dbdData.clear;
   DbLcCarteira.clear;
end;

procedure TFrmSelApuraCota.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlParamCotaInvest := TCtrlParamCotaInvest.Create;
   CtrlParamCotaInvest.InitializeAs(Padroes);
   CtrlParamCotaInvest.cdsParamCotaInvest := CdsCarteira;
end;

procedure TFrmSelApuraCota.FormDestroy(Sender: TObject);
begin
  inherited;
   FreeAndNil(CtrlParamCotaInvest);
end;

procedure TFrmSelApuraCota.FormShow(Sender: TObject);
begin
  inherited;
   CdsCarteira.Data := CtrlParamCotaInvest.ListParamCotaInvest;
end;

procedure TFrmSelApuraCota.DbLcCarteiraExit(Sender: TObject);
begin
  inherited;
   if Trim(DbLcCarteira.Text) <> '' then
      dbdData.Date := DiasUteisInvest.PrimeiroDiaUtilPosterior(CdsCarteira.FieldByName('DATAULTFECH').AsDateTime,-1,1,'',True,False,False);
end;

procedure TFrmSelApuraCota.DbLcCarteiraCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   if Trim(DbLcCarteira.Text) <> '' then
      dbdData.Date := DiasUteisInvest.PrimeiroDiaUtilPosterior(CdsCarteira.FieldByName('DATAULTFECH').AsDateTime,-1,1,'',True,False,False);
end;

procedure TFrmSelApuraCota.SetCarteiraInvest(const Value: Integer);
begin
  FCarteiraInvest := Value;
end;

procedure TFrmSelApuraCota.SetDataCalc(const Value: TDateTime);
begin
  FDataCalc := Value;
end;

end.
