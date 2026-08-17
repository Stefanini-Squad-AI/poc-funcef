unit FSelApuraCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, wwdblook, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  Db, DBClient, uCMClientDataSet, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, uCtrlPadroes, uCtrlParamCotaInvest,
  Wwdatsrc, uCmSqlParams, uMensErro, FCadastroGridMTInv;

type
  TFrmSelApuraCaixa = class(TfrmOkCancelarInv)
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
  FrmSelApuraCaixa: TFrmSelApuraCaixa;

implementation

uses FProcCalcCaixa, UDiasUteisInvest, FTelaAut;

{$R *.DFM}

procedure TFrmSelApuraCaixa.bbtnConfirmarClick(Sender: TObject);
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

procedure TFrmSelApuraCaixa.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   dbdData.clear;
   DbLcCarteira.clear;
end;

procedure TFrmSelApuraCaixa.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlParamCotaInvest := TCtrlParamCotaInvest.Create;
   CtrlParamCotaInvest.InitializeAs(Padroes);
   CtrlParamCotaInvest.cdsParamCotaInvest := CdsCarteira;
end;

procedure TFrmSelApuraCaixa.FormDestroy(Sender: TObject);
begin
  inherited;
   FreeAndNil(CtrlParamCotaInvest);
end;

procedure TFrmSelApuraCaixa.FormShow(Sender: TObject);
begin
  inherited;
   CdsCarteira.Data := CtrlParamCotaInvest.ListParamCotaInvest;
end;

procedure TFrmSelApuraCaixa.DbLcCarteiraExit(Sender: TObject);
begin
  inherited;
   if Trim(DbLcCarteira.Text) <> '' then
      dbdData.Date := DiasUteisInvest.PrimeiroDiaUtilPosterior(CdsCarteira.FieldByName('DATAULTFECH').AsDateTime,-1,1,'',True,False,False);
end;

procedure TFrmSelApuraCaixa.DbLcCarteiraCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   if Trim(DbLcCarteira.Text) <> '' then
      dbdData.Date := DiasUteisInvest.PrimeiroDiaUtilPosterior(CdsCarteira.FieldByName('DATAULTFECH').AsDateTime,-1,1,'',True,False,False);
end;

procedure TFrmSelApuraCaixa.SetCarteiraInvest(const Value: Integer);
begin
  FCarteiraInvest := Value;
end;

procedure TFrmSelApuraCaixa.SetDataCalc(const Value: TDateTime);
begin
  FDataCalc := Value;
end;

end.
