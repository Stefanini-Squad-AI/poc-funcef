unit FLancaDeducaoINSS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc,
  DBClient, uCMClientDataSet, uMensErro, uDataBase, uCtrlUtilLancaEspecial, uCtrlNatuRendimento, uCtrlInforme,
  uSistema, DBasedados, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
  DBTables, FProgresso, ComCtrls, CheckLst;

type
  TfrmLancaDeducaoINSS = class(TfrmOkCancelar)
    gbPeriodoApu: TGroupBox;
    lblDataIni: TLabel;
    lblDataFim: TLabel;
    deDataIni: TCMDateTimePicker;
    deDataFim: TCMDateTimePicker;
    CdsLanca: TCMClientDataSet;
    cdsLancaInforme: TCMClientDataSet;
    cdsInforme: TCMClientDataSet;
    cdsNatureza: TCMClientDataSet;
    Label1: TLabel;
    dsInforme: TDataSource;
    dbcboInforme: TwwDBLookupCombo;
    cdsNaturezaSel: TCMClientDataSet;
    dsNatureza: TDataSource;
    dsNaturezaSel: TDataSource;
    SpeedButton3: TSpeedButton;
    qryInsert: TQuery;
    qryInsertLanc: TQuery;
    dblkNatureza: TwwDBLookupCombo;
    Label3: TLabel;
    Label2: TLabel;
    dblkRendimento: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlLancaEspecial  : TCtrlUtilLancaEspecial;
    CtrlNatuRendimento : TCtrlNatuRendimento;
    CtrlInforme        : TCtrlInforme;
  public
    { Public declarations }
  end;

var
  frmLancaDeducaoINSS: TfrmLancaDeducaoINSS;

implementation

{$R *.DFM}



procedure TfrmLancaDeducaoINSS.FormCreate(Sender: TObject);
var i : Integer;
begin
   inherited;
   CtrlLancaEspecial  := TCtrlUtilLancaEspecial.Create;
   CtrlNatuRendimento := TCtrlNatuRendimento.Create;
   CtrlInforme        := TCtrlInforme.Create;
   CtrlLancaEspecial.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer,True,nil,nil,False);
   CtrlNatuRendimento.InitializeAs(CtrlLancaEspecial);
   CtrlInforme.InitializeAs(CtrlLancaEspecial);

   deDataIni.Date      := StrToDate('01/08/2004');
   deDataFim.Date      := StrToDate('31/12/2004');
   cdsInforme.Data     := CtrlInforme.ListInforme;
   cdsNatureza.Data    := CtrlNaturendimento.ListNaturendimento;

end;



procedure TfrmLancaDeducaoINSS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CtrlNatuRendimento.Free;
   CtrlInforme.Free;
   CtrlLancaEspecial.Free;
   inherited;
end;



procedure TfrmLancaDeducaoINSS.bbtnConfirmarClick(Sender: TObject);
var
   sNatureza  : String;
   iContador, iCodDoc, iLancIRRF  : Integer;
   bMarcado, bLanc   : Boolean;
   sRendim    : String;
   fTotalRend : Extended;
begin
   inherited;
   if deDataIni.Date < StrToDate('01/01/2004') then
   begin
      MsgDlg('Data inicial não pode ser inferior a 01/01/2004','Erro',mtError,[mbOk],0);
      deDataIni.SetFocus;
      exit;
   end;

   if deDataIni.Date > StrToDate('31/12/2004') then
   begin
      MsgDlg('Data inicial não pode ser superior a 31/12/2004','Erro',mtError,[mbOk],0);
      deDataIni.SetFocus;
      exit;
   end;

   if deDataFim.Date > StrToDate('31/12/2004') then
   begin
      MsgDlg('Data final não pode ser superior a 31/12/2004','Erro',mtError,[mbOk],0);
      deDataFim.SetFocus;
      exit;
   end;

   if deDataIni.Date > deDataFim.Date then
   begin
      MsgDlg('Data inicial não pode ser superior a data final','Erro',mtError,[mbOk],0);
      deDataIni.SetFocus;
      exit;
   end;

   if dbcboInforme.LookupValue = '' then
   begin
      MsgDlg('É obrigatório o preenchimento da linha de informe para lançamento da dedução','Erro',mtError,[mbOk],0);
      dbcboInforme.SetFocus;
      exit;
   end;

   bMarcado := False;
   sRendim  := '';

   cdsLanca.Data := CtrlLancaEspecial.ListaDadosLancINSS(DateToStr(deDataIni.Date),DateToStr(deDataFim.Date),sNatureza, sRendim);

   iContador := 0;
   frmProgresso.MostraFormProgresso('Processando',True,False,True,0,cdsLanca.RecordCount);

   while not cdsLanca.Eof do
   begin
      iCodDoc := cdsLanca.FieldByName('CODDOCUMENTO').AsInteger;
      cdsNaturezaSel.Data := CtrlLancaEspecial.LancNext('SELECT SEQLANCIRRF.NEXTVAL AS LANCIR FROM DUAL ');
      iLancIRRF := cdsNaturezaSel.FieldByName('LANCIR').AsInteger;
      bLanc := True;
      while (not cdsLanca.Eof) and (iCodDoc = cdsLanca.FieldByName('CODDOCUMENTO').AsInteger) do
      begin
         Inc(iContador);
         frmProgresso.AndaFormProgresso(iContador);
         Application.ProcessMessages;
         Repaint;
         try
            dtmBaseDados.dbBaseDados.StartTransaction;
            if bLanc Then Begin
               qryInsertLanc.ParamByName('IDLANCIRRF').AsInteger      := iLancIRRF;
               qryInsertLanc.ParamByName('IDBENEFIRRF').AsInteger     := cdsLanca.FieldByName('IDFORCLI').AsInteger;
               qryInsertLanc.ParamByName('DATALANCAMENTO').AsDateTime := cdsLanca.FieldByName('DATALANCTO').AsDateTime;
               qryInsertLanc.ParamByName('CODDOCUMENTO').AsInteger    := iCodDoc;
               qryInsertLanc.ParamByName('IDPESSOA').AsInteger        := cdsLanca.FieldByName('IDPESSOA').AsInteger;
               qryInsertLanc.ParamByName('VLRBASE').AsFloat           := cdsLanca.FieldByName('VALBASE').AsFloat;
               qryInsertLanc.ParamByName('CODNATUREZA').AsString     := dblkNatureza.LookupValue;
               qryInsertLanc.ParamByName('VLRINSS').AsFloat           := cdsLanca.FieldByName('VALOR').AsFloat;
               qryInsertLanc.ExecSQL;
               bLanc := False;
            end;
            // Grava o INSS
            qryInsert.ParamByName('IDINFORME').AsInteger  := StrToint(dbcboInforme.LookupValue);
            qryInsert.ParamByName('IDLANCIRRF').AsInteger := iLancIRRF;
            qryInsert.ParamByName('VLRLANC').AsFloat      := cdsLanca.FieldByName('VALOR').AsFloat;;
            qryInsert.ExecSql;
            // Grava o Rendimento
            qryInsert.ParamByName('IDINFORME').AsInteger  := StrToint(dblkRendimento.LookupValue);
            qryInsert.ParamByName('IDLANCIRRF').AsInteger := iLancIRRF;
            qryInsert.ParamByName('VLRLANC').AsFloat      := cdsLanca.FieldByName('VALBASE').AsFloat;;
            qryInsert.ExecSql;

            dtmBaseDados.dbBaseDados.Commit;
         except
            dtmBaseDados.dbBaseDados.RollBack;
         end;
         cdsLanca.Next;
      end;
   end;
   frmProgresso.EscondeFormProgresso;
   MsgDlg('Fim de Processamento.','Aviso',mtWarning,[mbOk],0);
end;

end.



