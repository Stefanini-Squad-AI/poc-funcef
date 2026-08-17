unit FCadDeParaCRMultiMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOKCANCELAR, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  wwdblook, uCtrlDeParaCR, uMensErro;

type
  TfrmCadDeParaCRMultiMT = class(TfrmOkCancelar)
    Panel1: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    DBcboPlanCRIni: TwwDBLookupCombo;
    lbOrigem: TListBox;
    Panel5: TPanel;
    Panel4: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    DBcboPlanCRFim: TwwDBLookupCombo;
    LbDestino: TListBox;
    pnlBotoes: TPanel;
    spdInclui: TSpeedButton;
    spdExclui: TSpeedButton;
    Panel3: TPanel;
    Panel6: TPanel;
    lbSelecionado: TListBox;
    sqlPlano: TCMSqlParams;
    cdsPlano: TCMClientDataSet;
    sqlCRIni: TCMSqlParams;
    cdsCRIni: TCMClientDataSet;
    cdsCRFim: TCMClientDataSet;
    sqlCRFim: TCMSqlParams;
    sqlComposicao: TCMSqlParams;
    cdsComposicao: TCMClientDataSet;
    cdsCodExterno: TCMClientDataSet;
    sqlCodExterno: TCMSqlParams;
    sqlCodCentroRespon: TCMSqlParams;
    cdsCodCentroRespon: TCMClientDataSet;
    procedure DBcboPlanCRIniCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DBcboPlanCRFimCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure spdIncluiClick(Sender: TObject);
    procedure spdExcluiClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
      CtrlDeParaCR : TCtrlDeParaCR;

      function CompletaInicio(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
      function CompletaFim(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
      procedure MontaSql;
      procedure MontaListaOrigem;
      procedure MontaListaDestino;
      procedure MontaListaComposicao;
  public
    { Public declarations }
  end;

var
  frmCadDeParaCRMultiMT: TfrmCadDeParaCRMultiMT;

implementation

{$R *.DFM}
uses dBaseDados, uSistema;



function TfrmCadDeParaCRMultiMT.CompletaInicio(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
var
   i     : Integer;
   sAux  : String;
begin
   sAux := '';
   for i := 1 to iLimiteTamanho do sAux := sAux + sCompleta;

   Result := copy((sAux + sOriginal), (length((sAux + sOriginal)) - (iLimiteTamanho - 1)), iLimiteTamanho);
end;



function TfrmCadDeParaCRMultiMT.CompletaFim(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
var
   i     : Integer;
   sAux  : String;
begin
   sAux := '';
   for i := 1 to iLimiteTamanho do sAux := sAux + sCompleta;

   Result := copy((sOriginal + sAux), 1, iLimiteTamanho);
end;



procedure TfrmCadDeParaCRMultiMT.MontaSql;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT ' + #13 +
   '    D.*, ' + #13 +
   '    CO.CODEXTERNO AS CODEXTERNOO, ' + #13 +
   '    CD.CODEXTERNO AS CODEXTERNOD, ' + #13 +
   '    CD.NOME  ' + #13 +
   'FROM ' + #13 +
   '    DEPARACR D, ' + #13 +
   '    CENTRESPON CO, ' + #13 +
   '    CENTRESPON CD ' + #13 +
   'WHERE ' + #13 +
   '    D.IDEMPRESAPROP   = ' +  IntToStr(Sistema.IdEmpresa) + #13;

   if DBcboPlanCRIni.LookupValue <> '' then
   begin
      sSQL := sSQL +
      'AND IDPLANCRINI = ' + DBcboPlanCRIni.LookupValue + #13;
   end;

   if DBcboPlanCRFim.LookupValue <> '' then
   begin
      sSQL := sSQL +
      'AND IDPLANCRFIM = ' + DBcboPlanCRFim.LookupValue + #13;
   end;

   sSQL := sSQL +
   'AND CD.CODCENTRORESPON = D.CODCRFIM  ' + #13 +
   'AND CO.CODCENTRORESPON = D.CODCRINI  ' + #13 +
   'ORDER BY ' + #13 +
   '    D.CODCRFIM, ' + #13 +
   '    D.CODCRINI, ' + #13 +
   '    CD.NOME ' + #13;
   sqlComposicao.Sql.Clear;
   sqlComposicao.Sql.Text := sSQL;
end;



procedure TfrmCadDeParaCRMultiMT.DBcboPlanCRIniCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   cdsCRIni.Close;
   cdsCRFim.Close;
   sqlCRIni.Prepare;
   sqlCRIni.ParamByName('PIDEMPRESA').AsInteger       := Sistema.IdEmpresa;
   sqlCRIni.ParamByName('PIDPLANCRESPON').AsInteger   := StrToInt(DBcboPlanCRIni.LookupValue);
   sqlCRIni.Open;
   MontaListaOrigem;

end;



procedure TfrmCadDeParaCRMultiMT.DBcboPlanCRFimCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   cdsCRFim.Close;
   sqlCRFim.Prepare;
   sqlCRFim.ParamByName('PIDEMPRESA').AsInteger       := Sistema.IdEmpresa;
   sqlCRFim.ParamByName('PIDPLANCRESPON').AsInteger   := StrToInt(DBcboPlanCRFim.LookupValue);
   sqlCRFim.Open;
   MontaListaDestino;
   bbtnConfirmar.Enabled  := False;
   bbtnCancelar.Enabled   := bbtnConfirmar.Enabled;

end;



procedure TfrmCadDeParaCRMultiMT.spdIncluiClick(Sender: TObject);
var
   sLinha   : String;
begin
   inherited;
   // P21367 - 26/01/2006
   If (LbOrigem.ItemIndex = -1) then
   begin
     MsgDlg('Centro de Responsabilidade Origem não foi selecionado!','Aviso',mtWarning,[mbOk],0);
     DBcboPlanCRIni.SetFocus;
     exit;
   end
   else
   If  (LbDestino.ItemIndex = -1) Then
   begin
     MsgDlg('Centro de Responsabilidade Destino não foi selecionado!','Aviso',mtWarning,[mbOk],0);
     DBcboPlanCRFim.SetFocus;
     exit;
   end
   else
     begin
     sLinha := Copy(lbOrigem.Items[lbOrigem.ItemIndex],1,7) +
             '    ' +
             Copy(lbDestino.Items[lbDestino.ItemIndex],1,7) +
             '     ' +
             Copy(lbOrigem.Items[lbOrigem.ItemIndex],Pos(' - ',lbOrigem.Items[lbOrigem.ItemIndex]) + 3,30);

     lbSelecionado.Items.Add(sLinha);
     lbOrigem.Items.Delete(lbOrigem.ItemIndex);

     DBcboPlanCRIni.Enabled := False;
     DBcboPlanCRFim.Enabled := False;
     bbtnConfirmar.Enabled  := True;
     bbtnCancelar.Enabled   := bbtnConfirmar.Enabled;
   end;
end;



procedure TfrmCadDeParaCRMultiMT.spdExcluiClick(Sender: TObject);
var
    sLinha : String;
begin
   inherited;
   //  P21367 - 26/01/2006
   If (LbSelecionado.ItemIndex = -1) Then
   begin
     MsgDlg('Composição de Centro de Responsabilidade não foi selecionada!','Aviso',mtWarning,[mbOk],0);
     exit;
     end
   else

   sLinha := Copy(lbSelecionado.Items[lbSelecionado.ItemIndex],1,7) +
             ' -  ' +
             Copy(lbSelecionado.Items[lbSelecionado.ItemIndex],24,30);

   lbOrigem.Items.Add(sLinha);
   lbSelecionado.Items.Delete(lbSelecionado.ItemIndex);

   DBcboPlanCRIni.Enabled := (lbSelecionado.Items.Count = 0);
   DBcboPlanCRFim.Enabled := DBcboPlanCRIni.Enabled;
end;



procedure TfrmCadDeParaCRMultiMT.bbtnConfirmarClick(Sender: TObject);
var
   sSQL      : String;
   iContador : Integer;
   sCodIni   : String;
   sCodFim   : String;
begin
   inherited;
   CtrlDeParaCR.Delete(StrToInt(DBcboPlanCRIni.LookupValue),
                       StrToInt(DBcboPlanCRFim.LookupValue)
                      );

   for iContador := 0 to lbSelecionado.Items.Count -1 do
   begin

      cdsCodCentroRespon.Close;
      sqlCodCentroRespon.Prepare;
      sqlCodCentroRespon.ParamByName('PIDEMPRESA').AsInteger       := Sistema.IdEmpresa;
      sqlCodCentroRespon.ParamByName('PIDPLANCRESPON').AsInteger   := StrToInt(DBcboPlanCRIni.LookupValue);
      sqlCodCentroRespon.ParamByName('PCODEXTERNO').AsString       := Trim(Copy(lbSelecionado.Items[iContador],1,7));
      sqlCodCentroRespon.Open;

      sCodIni := cdsCodCentroRespon.FieldByName('CODCENTRORESPON').AsString;

      cdsCodCentroRespon.Close;
      sqlCodCentroRespon.Prepare;
      sqlCodCentroRespon.ParamByName('PIDEMPRESA').AsInteger       := Sistema.IdEmpresa;
      sqlCodCentroRespon.ParamByName('PIDPLANCRESPON').AsInteger   := StrToInt(DBcboPlanCRFim.LookupValue);
      sqlCodCentroRespon.ParamByName('PCODEXTERNO').AsString       := Trim(Copy(lbSelecionado.Items[iContador],12,7));
      sqlCodCentroRespon.Open;

      sCodFim := cdsCodCentroRespon.FieldByName('CODCENTRORESPON').AsString;

      CtrlDeParaCR.Insert(StrToInt(DBcboPlanCRIni.LookupValue),
                          StrToInt(DBcboPlanCRFim.LookupValue),
                          sCodIni,
                          sCodFim,
                          Sistema.IDEmpresa
                         );
   end;

   DBcboPlanCRIni.Enabled := True;
   DBcboPlanCRFim.Enabled := True;
   bbtnConfirmar.Enabled  := False;
   bbtnCancelar.Enabled   := bbtnConfirmar.Enabled;
end;



procedure TfrmCadDeParaCRMultiMT.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   DBcboPlanCRIni.Enabled := True;
   DBcboPlanCRFim.Enabled := True;

   DBcboPlanCRIniCloseUp(DBcboPlanCRIni,DBcboPlanCRIni.LookupTable,nil, False);
   DBcboPlanCRFimCloseUp(DBcboPlanCRFim,DBcboPlanCRFim.LookupTable,nil, False);
   bbtnConfirmar.Enabled  := False;
   bbtnCancelar.Enabled   := bbtnConfirmar.Enabled;

end;



procedure TfrmCadDeParaCRMultiMT.FormShow(Sender: TObject);
begin
   inherited;
   sqlPlano.Open;
   cdsPlano.First;

   DBcboPlanCRIni.LookupValue := cdsPlano.FieldByName('IDPLANCRESPON').AsString;
   DBcboPlanCRFim.LookupValue := cdsPlano.FieldByName('IDPLANCRESPON').AsString;

end;



procedure TfrmCadDeParaCRMultiMT.MontaListaOrigem;
var
    sLinha : String;
begin
   lbOrigem.Items.Clear;

   cdsComposicao.Close;
   MontaSql;
   sqlComposicao.Open;

   while not cdsCRIni.Eof do
   begin
      if not cdsComposicao.Locate('CODCRINI',cdsCRIni.FieldByName('CODCENTRORESPON').AsString,[]) then
      begin
         sLinha := CompletaInicio(cdsCRIni.FieldByName('CODEXTERNO').AsString,' ',7) +
                   ' - ' +
                   CompletaFim(cdsCRIni.FieldByName('NOME').AsString,' ', 30);

         lbOrigem.Items.Add(sLinha);
      end;
      cdsCRIni.Next;
   end;
end;



procedure TfrmCadDeParaCRMultiMT.MontaListaDestino;
var
    sLinha : String;
begin
   lbDestino.Items.Clear;
   while not cdsCRFim.Eof do
   begin
      sLinha := CompletaInicio(cdsCRFim.FieldByName('CODEXTERNO').AsString,' ',7) +
                ' - ' +
                CompletaFim(cdsCRFim.FieldByName('NOME').AsString,' ', 30);

      LbDestino.Items.Add(sLinha);
      cdsCRFim.Next;
   end;
   MontaListaComposicao;

end;



procedure TfrmCadDeParaCRMultiMT.MontaListaComposicao;
var
    sLinha  : String;
    sCodIni : String;
    sCodFim : String;
begin
   cdsComposicao.Close;
   MontaSql;
   sqlComposicao.Open;

   lbSelecionado.Items.Clear;
   while not cdsComposicao.Eof do
   begin


      cdsCodExterno.Close;
      sqlCodExterno.Prepare;
      sqlCodExterno.ParamByName('PIDEMPRESA').AsInteger       := Sistema.IdEmpresa;
      sqlCodExterno.ParamByName('PIDPLANCRESPON').AsInteger   := StrToInt(DBcboPlanCRIni.LookupValue);
      sqlCodExterno.ParamByName('PCODCENTRORESPON').AsString  := cdsComposicao.FieldByName('CODCRINI').AsString;
      sqlCodExterno.Open;

      sCodIni := cdsCodExterno.FieldByName('CODEXTERNO').AsString;

      cdsCodExterno.Close;
      sqlCodExterno.Prepare;
      sqlCodExterno.ParamByName('PIDEMPRESA').AsInteger       := Sistema.IdEmpresa;
      sqlCodExterno.ParamByName('PIDPLANCRESPON').AsInteger   := StrToInt(DBcboPlanCRFim.LookupValue);
      sqlCodExterno.ParamByName('PCODCENTRORESPON').AsString  := cdsComposicao.FieldByName('CODCRFIM').AsString;
      sqlCodExterno.Open;

      sCodFim := cdsCodExterno.FieldByName('CODEXTERNO').AsString;

      sLinha := CompletaInicio(sCodIni,' ',7) +
                '    ' +
                CompletaInicio(sCodFim,' ', 7) +
                '     ' +
                CompletaFim(cdsComposicao.FieldByName('NOME').AsString,' ', 30);

      lbSelecionado.Items.Add(sLinha);
      cdsComposicao.Next;
   end;
end;



procedure TfrmCadDeParaCRMultiMT.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlDeParaCR := TCtrlDeParaCR.Create;

   CtrlDeParaCR.Initialize(DtmBaseDados.dbBaseDados,
                           True,
                           Sistema.ConnectionType,
                           Sistema.ConnectionSide,
                           Sistema.AppRemoteServer,
                           True);

end;



procedure TfrmCadDeParaCRMultiMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CtrlDeParaCR.Free;
   inherited;

end;



end.
