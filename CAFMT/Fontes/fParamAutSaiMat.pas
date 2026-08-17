unit fParamAutSaiMat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, wwdblook,
  Wwdatsrc, Mask, wwdbedit, MontaSelect, Wwquery, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmParamAutSaiMat = class(TfrmOkCancelar)
    dteDataMovIni: TCMDateTimePicker;
    Label1: TLabel;
    dteDataMovFim: TCMDateTimePicker;
    Label2: TLabel;
    Label4: TLabel;
    edTermo: TwwDBEdit;
    bbtnSelTermo: TBitBtn;
    qrySelTermo: TwwQuery;
    qrySelTermoIDSAIDATEMPORARIA: TFloatField;
    qrySelTermoSTPTERMO: TFloatField;
    qrySelTermoSTPDATA: TDateTimeField;
    qrySelTermoIDTIPOSAIDATEMP: TFloatField;
    qrySelTermoIDPESSOA: TFloatField;
    qrySelTermoIDLOCALIZACAO: TFloatField;
    qrySelTermoIDRESPONSAVEL: TFloatField;
    qrySelTermoSTPOBSERVACOES: TStringField;
    qrySelTermoSTPDATARETORNO: TDateTimeField;
    dsSelTermo: TwwDataSource;
    MSTermo: TMontaSelect;
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dteDataMovIniExit(Sender: TObject);
    procedure dteDataMovFimExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelTermoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamAutSaiMat: TfrmParamAutSaiMat;

implementation

{$R *.DFM}

uses uSistema, dRelOperCaf,  uMensErro, dAtivoFixo;

procedure TfrmParamAutSaiMat.FormActivate(Sender: TObject);
begin
   inherited;
   if not qrySelTermo.Prepared then qrySelTermo.Prepare;
   //-------------------------------------------------------------------------------------
   qrySelTermo.Close;
   qrySelTermo.ParamByName('PIDSAIDATEMP').AsInteger := -1;
   qrySelTermo.Open;
   //-------------------------------------------------------------------------------------
   dteDataMovIni.Date := (date - 30);
   dteDataMovFim.Date := date;
end;
//========================================================================================
procedure TfrmParamAutSaiMat.dteDataMovIniExit(Sender: TObject);
begin
   inherited;
   if dteDataMovIni.Text = '' then
      dteDataMovIni.SetFocus;
end;
//========================================================================================
procedure TfrmParamAutSaiMat.dteDataMovFimExit(Sender: TObject);
begin
   inherited;
   if dteDataMovFim.Text = '' then
      dteDataMovFim.SetFocus;
end;
//========================================================================================
procedure TfrmParamAutSaiMat.bbtnSelTermoClick(Sender: TObject);
begin
   Screen.Cursor := crSQLWait;
   MSTermo.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if (MSTermo.ValoresChave.Count > 0) and (MSTermo.ValoresChave[0] <> '') then
   begin
      qrySelTermo.Close;
      qrySelTermo.ParamByName('PIDSAIDATEMP').AsInteger := StrToInt(MSTermo.ValoresChave[0]);
      qrySelTermo.Open;
   end else
   begin
      qrySelTermo.Close;
      qrySelTermo.ParamByName('PIDSAIDATEMP').AsInteger := -1;
      qrySelTermo.Open;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmParamAutSaiMat.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   with dtmRelOperCaf.qryAutSaiMat do
   begin
      Close;
      SQL.Clear;
      //----------------------------------------------------------------------------------
      SQL.Add('SELECT B.PLACA, B.DESBEM, STB.IDBEM, B.PUBAUTOR, B.PUBEDITORA, B.PUBANO, ');
      SQL.Add('       ST.STPTERMO, ST.STPDATA,                      ');
      SQL.Add('       TST.DESCTIPSAITEMP,                           ');
      SQL.Add('       L.NOME AS DESCDESTINO,                        ');
      SQL.Add('       L.ENDERECO,                                   ');
      SQL.Add('       P.NOME AS NOMERESPSAIDA,                      ');
      SQL.Add('       ST.STPOBSERVACOES                             ');
      SQL.Add('FROM SAIDATEMPORARIA ST,                             ');
      SQL.Add('     SAIDATEMPBENS   STB,                            ');
      SQL.Add('     BEM             B,                              ');
      SQL.Add('     LOCALIZACAO     L,                              ');
      SQL.Add('     PESSOA          P,                              ');
      SQL.Add('     TIPOSAIDATEMP   TST                             ');
      SQL.Add('WHERE                                                ');
      //----------------------------------------------------------------------------------
      if (dteDataMovIni.Text <> '') then
      begin
         SQL.Add('      (ST.STPDATA >= TO_DATE('''+ dteDataMovIni.Text + ''',''DD/MM/YYYY'')) AND ');
      end;
      //----------------------------------------------------------------------------------
      if (dteDataMovFim.Text <> '') then
      begin
         SQL.Add('      (ST.STPDATA <= TO_DATE('''+ dteDataMovFim.Text + ''',''DD/MM/YYYY'')) AND ');
      end;
      //----------------------------------------------------------------------------------
      if not qrySelTermo.IsEmpty then
         SQL.Add('      (ST.STPTERMO = ' + inttostr(qrySelTermoSTPTERMO.AsInteger) + ') AND ');
      //----------------------------------------------------------------------------------
      SQL.Add('      (ST.IDSAIDATEMPORARIA = STB.IDSAIDATEMPORARIA) ');
      SQL.Add('  AND (STB.IDBEM            = B.IDBEM)               ');
      SQL.Add('  AND (STB.IDPESSOA         = B.IDPESSOA)            ');
      SQL.Add('  AND (ST.IDLOCALIZACAO     = L.IDLOCALIZACAO)       ');
      SQL.Add('  AND (ST.IDPESSOA          = L.IDPESSOA)            ');
      SQL.Add('  AND (ST.IDRESPONSAVEL     = P.IDPESSOA)            ');
      SQL.Add('  AND (ST.IDTIPOSAIDATEMP   = TST.IDTIPOSAIDATEMP)   ');
      SQL.Add('ORDER BY ST.STPTERMO, B.PLACA ');
   end;
   //-------------------------------------------------------------------------------------
   with dtmRelOperCaf do
   begin
      qryAutSaiMat.Open;
      Screen.Cursor := crDefault;
      if qryAutSaiMat.IsEmpty then
         MsgDlg('Não há Termo cadastrado no Periodo especificado!',
                'Erro',mtError,[mbOk],0);
   end;
end;
//========================================================================================
procedure TfrmParamAutSaiMat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qrySelTermo.Close;
   qrySelTermo.UnPrepare;
end;

end.
