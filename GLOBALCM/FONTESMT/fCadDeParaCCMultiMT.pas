unit fCadDeParaCCMultiMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOKCANCELAR, uCmSqlParams, Db, DBClient, uCMClientDataSet, Buttons,
  StdCtrls, wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
  TB97, ExtCtrls, uCtrlDeParaCC, uMensErro;

type
  TfrmCadDeParaCCMultiMT = class(TfrmOkCancelar)
    lbSelecionado: TListBox;
    Panel6: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel1: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    DBcboPlanCCIni: TwwDBLookupCombo;
    lbOrigem: TListBox;
    Panel4: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    DBcboPlanCCFim: TwwDBLookupCombo;
    LbDestino: TListBox;
    pnlBotoes: TPanel;
    spdInclui: TSpeedButton;
    spdExclui: TSpeedButton;
    cdsCCIni: TCMClientDataSet;
    sqlCCIni: TCMSqlParams;
    cdsCCFim: TCMClientDataSet;
    sqlCCFim: TCMSqlParams;
    sqlComposicao: TCMSqlParams;
    cdsComposicao: TCMClientDataSet;
    sqlPlano: TCMSqlParams;
    cdsPlano: TCMClientDataSet;
    sqlCodExterno: TCMSqlParams;
    cdsCodExterno: TCMClientDataSet;
    cdsCodCentroCusto: TCMClientDataSet;
    sqlCodCentroCusto: TCMSqlParams;
    procedure DBcboPlanCCIniCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DBcboPlanCCFimCloseUp(Sender: TObject; LookupTable,
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

      CtrlDeParaCC : TCtrlDeParaCC;

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
  frmCadDeParaCCMultiMT: TfrmCadDeParaCCMultiMT;

implementation

{$R *.DFM}
uses dBaseDados, uSistema;


function TfrmCadDeParaCCMultiMT.CompletaInicio(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
var
   i     : Integer;
   sAux  : String;
begin
   sAux := '';
   for i := 1 to iLimiteTamanho do sAux := sAux + sCompleta;

   Result := copy((sAux + sOriginal), (length((sAux + sOriginal)) - (iLimiteTamanho - 1)), iLimiteTamanho);
end;



function TfrmCadDeParaCCMultiMT.CompletaFim(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
var
   i     : Integer;
   sAux  : String;
begin
   sAux := '';
   for i := 1 to iLimiteTamanho do sAux := sAux + sCompleta;

   Result := copy((sOriginal + sAux), 1, iLimiteTamanho);
end;



procedure TfrmCadDeParaCCMultiMT.MontaSql;
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
   '    DEPARACC D, ' + #13 +
   '    CENTCUST CD, ' + #13 +
   '    CENTCUST CO ' + #13 +
   'WHERE ' + #13 +
   '    D.IDEMPRESAPROP   = ' +  IntToStr(Sistema.IdEmpresa) + #13;

   if DBcboPlanCCIni.LookupValue <> '' then
   begin
      sSQL := sSQL +
      'AND IDPLANCCINI = ' + DBcboPlanCCIni.LookupValue + #13;
   end;

   if DBcboPlanCCFim.LookupValue <> '' then
   begin
      sSQL := sSQL +
      'AND IDPLANCCFIM = ' + DBcboPlanCCFim.LookupValue + #13;
   end;

   sSQL := sSQL +
   'AND CD.CODCENTROCUSTO = D.CODCCFIM  ' + #13 +
   'AND CO.CODCENTROCUSTO = D.CODCCINI  ' + #13 +
   'ORDER BY ' + #13 +
   '    D.CODCCFIM, ' + #13 +
   '    D.CODCCINI, ' + #13 +
   '    CD.NOME ' + #13;
   sqlComposicao.Sql.Clear;
   sqlComposicao.Sql.Text := sSQL;

end;



procedure TfrmCadDeParaCCMultiMT.DBcboPlanCCIniCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var sLinha : String;
begin
   inherited;

   cdsCCIni.Close;
   cdsCCFim.Close;
   sqlCCIni.Prepare;
   sqlCCIni.ParamByName('PIDEMPRESA').AsInteger       := Sistema.IdEmpresa;
   sqlCCIni.ParamByName('PIDPLANCENTCUST').AsInteger  := StrToInt(DBcboPlanCCIni.LookupValue);
   sqlCCIni.Open;
   MontaListaOrigem;
end;



procedure TfrmCadDeParaCCMultiMT.DBcboPlanCCFimCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   cdsCCFim.Close;
   sqlCCFim.Prepare;
   sqlCCFim.ParamByName('PIDEMPRESA').AsInteger       := Sistema.IdEmpresa;
   sqlCCFim.ParamByName('PIDPLANCENTCUST').AsInteger  := StrToInt(DBcboPlanCCFim.LookupValue);
   sqlCCFim.Open;
   MontaListaDestino;
   bbtnConfirmar.Enabled  := False;
   bbtnCancelar.Enabled   := bbtnConfirmar.Enabled;
end;



procedure TfrmCadDeParaCCMultiMT.spdIncluiClick(Sender: TObject);
var
   sLinha   : String;
begin
   inherited;
   // P21367 - 26/01/2006
   // begin
   If (LbOrigem.ItemIndex = -1) then
   begin
     MsgDlg('Centro de Custo Origem não foi selecionado!','Aviso',mtWarning,[mbOk],0);
     DBcboPlanCCIni.SetFocus;
     exit;
   end  
   else
   If  (LbDestino.ItemIndex = -1) Then
   begin
     MsgDlg('Centro de Custo Destino não foi selecionado!','Aviso',mtWarning,[mbOk],0);
     DBcboPlanCCFim.SetFocus;
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

   DBcboPlanCCIni.Enabled := False;
   DBcboPlanCCFim.Enabled := False;
   bbtnConfirmar.Enabled  := True;
   bbtnCancelar.Enabled   := bbtnConfirmar.Enabled;
end;
end;



procedure TfrmCadDeParaCCMultiMT.spdExcluiClick(Sender: TObject);
var
    sLinha : String;
begin
   inherited;
   // P21367 - 26/01/2006
   // begin
   If (LbSelecionado.ItemIndex = -1) Then
   begin
     MsgDlg('Composição de Centro de Custo não foi selecionada!','Aviso',mtWarning,[mbOk],0);
     exit;
     end
   else
   sLinha := Copy(lbSelecionado.Items[lbSelecionado.ItemIndex],1,7) +
             ' -  ' +
             Copy(lbSelecionado.Items[lbSelecionado.ItemIndex],24,30);

   lbOrigem.Items.Add(sLinha);
   lbSelecionado.Items.Delete(lbSelecionado.ItemIndex);

   DBcboPlanCCIni.Enabled := (lbSelecionado.Items.Count = 0);
   DBcboPlanCCFim.Enabled := DBcboPlanCCIni.Enabled;
end;



procedure TfrmCadDeParaCCMultiMT.bbtnConfirmarClick(Sender: TObject);
var
   sSQL      : String;
   iContador : Integer;
   sCodIni   : String;
   sCodFim   : String;
begin
   inherited;
   CtrlDeParaCC.Delete(StrToInt(DBcboPlanCCIni.LookupValue),
                       StrToInt(DBcboPlanCCFim.LookupValue)
                      );

   for iContador := 0 to lbSelecionado.Items.Count -1 do
   begin

      cdsCodCentroCusto.Close;
      sqlCodCentroCusto.Prepare;
      sqlCodCentroCusto.ParamByName('PIDEMPRESA').AsInteger       := Sistema.IdEmpresa;
      sqlCodCentroCusto.ParamByName('PIDPLANCENTCUST').AsInteger  := StrToInt(DBcboPlanCCIni.LookupValue);
      sqlCodCentroCusto.ParamByName('PCODEXTERNO').AsString       := Trim(Copy(lbSelecionado.Items[iContador],1,7));
      sqlCodCentroCusto.Open;

      sCodIni := cdsCodCentroCusto.FieldByName('CODCENTROCUSTO').AsString;

      cdsCodCentroCusto.Close;
      sqlCodCentroCusto.Prepare;
      sqlCodCentroCusto.ParamByName('PIDEMPRESA').AsInteger       := Sistema.IdEmpresa;
      sqlCodCentroCusto.ParamByName('PIDPLANCENTCUST').AsInteger  := StrToInt(DBcboPlanCCFim.LookupValue);
      sqlCodCentroCusto.ParamByName('PCODEXTERNO').AsString       := Trim(Copy(lbSelecionado.Items[iContador],12,7));
      sqlCodCentroCusto.Open;

      sCodFim := cdsCodCentroCusto.FieldByName('CODCENTROCUSTO').AsString;

      CtrlDeParaCC.Insert(StrToInt(DBcboPlanCCIni.LookupValue),
                          StrToInt(DBcboPlanCCFim.LookupValue),
                          sCodIni,
                          sCodFim,
                          Sistema.IDEmpresa
                         );
   end;

   DBcboPlanCCIni.Enabled := True;
   DBcboPlanCCFim.Enabled := True;
   bbtnConfirmar.Enabled  := False;
   bbtnCancelar.Enabled   := bbtnConfirmar.Enabled;
end;



procedure TfrmCadDeParaCCMultiMT.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   DBcboPlanCCIni.Enabled := True;
   DBcboPlanCCFim.Enabled := True;

   DBcboPlanCCIniCloseUp(DBcboPlanCCIni,DBcboPlanCCIni.LookupTable,nil, False);
   DBcboPlanCCFimCloseUp(DBcboPlanCCFim,DBcboPlanCCFim.LookupTable,nil, False);
   bbtnConfirmar.Enabled  := False;
   bbtnCancelar.Enabled   := bbtnConfirmar.Enabled;
end;



procedure TfrmCadDeParaCCMultiMT.FormShow(Sender: TObject);
begin
   inherited;
   sqlPlano.Open;
   cdsPlano.First;

   DBcboPlanCCIni.LookupValue := cdsPlano.FieldByName('IDPLANCENTCUST').AsString;
   DBcboPlanCCFim.LookupValue := cdsPlano.FieldByName('IDPLANCENTCUST').AsString;
end;



procedure TfrmCadDeParaCCMultiMT.MontaListaOrigem;
var
    sLinha : String;
begin
   lbOrigem.Items.Clear;

   cdsComposicao.Close;
   MontaSql;
   sqlComposicao.Open;

   while not cdsCCIni.Eof do
   begin
      if not cdsComposicao.Locate('CODCCINI',cdsCCIni.FieldByName('CODCENTROCUSTO').AsString,[]) then
      begin
         sLinha := CompletaInicio(cdsCCIni.FieldByName('CODEXTERNO').AsString,' ',7) +
                   ' - ' +
                   CompletaFim(cdsCCIni.FieldByName('NOME').AsString,' ', 30);

         lbOrigem.Items.Add(sLinha);
      end;
      cdsCCIni.Next;
   end;
end;



procedure TfrmCadDeParaCCMultiMT.MontaListaDestino;
var
    sLinha : String;
begin
   lbDestino.Items.Clear;
   while not cdsCCFim.Eof do
   begin
      sLinha := CompletaInicio(cdsCCFim.FieldByName('CODEXTERNO').AsString,' ',7) +
                ' - ' +
                CompletaFim(cdsCCFim.FieldByName('NOME').AsString,' ', 30);

      LbDestino.Items.Add(sLinha);
      cdsCCFim.Next;
   end;
   MontaListaComposicao;

end;



procedure TfrmCadDeParaCCMultiMT.MontaListaComposicao;
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
      sqlCodExterno.ParamByName('PIDPLANCENTCUST').AsInteger  := StrToInt(DBcboPlanCCIni.LookupValue);
      sqlCodExterno.ParamByName('PCODCENTROCUSTO').AsString   := cdsComposicao.FieldByName('CODCCINI').AsString;
      sqlCodExterno.Open;

      sCodIni := cdsCodExterno.FieldByName('CODEXTERNO').AsString;

      cdsCodExterno.Close;
      sqlCodExterno.Prepare;
      sqlCodExterno.ParamByName('PIDEMPRESA').AsInteger       := Sistema.IdEmpresa;
      sqlCodExterno.ParamByName('PIDPLANCENTCUST').AsInteger  := StrToInt(DBcboPlanCCFim.LookupValue);
      sqlCodExterno.ParamByName('PCODCENTROCUSTO').AsString   := cdsComposicao.FieldByName('CODCCFIM').AsString;
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



procedure TfrmCadDeParaCCMultiMT.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlDeParaCC := TCtrlDeParaCC.Create;

   CtrlDeParaCC.Initialize(DtmBaseDados.dbBaseDados,
                           True,
                           Sistema.ConnectionType,
                           Sistema.ConnectionSide,
                           Sistema.AppRemoteServer,
                           True);

end;



procedure TfrmCadDeParaCCMultiMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CtrlDeParaCC.Free;
   inherited;
end;



end.
