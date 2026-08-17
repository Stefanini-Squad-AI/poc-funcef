unit fInvColScwLucas7000;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, Db, DBTables, Wwquery;

type
  TfrmInvColScwLucas7000 = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    qryParam: TwwQuery;
    qryParamCDPORTA: TFloatField;
    qryParamCDVELOC: TStringField;
    updParam: TUpdateSQL;
    qryParamIDPESSOA: TFloatField;
    pnlOperacao: TPanel;
    qryParamCDPATH: TStringField;
    qryBuscaConjunto: TwwQuery;
    qryBuscaConjuntoIDCONJUNTO: TFloatField;
    qryBuscaBem: TwwQuery;
    qryLancResult: TwwQuery;
    qryBuscaBemIDINVENTARIOBENS: TFloatField;
    qryBuscaBemIDEMPRESA: TFloatField;
    qryBuscaBemIIBPLACA: TFloatField;
    qryBuscaBemIIBLOCALATUAL: TFloatField;
    qryBuscaBemIIBCONJUNTOATUAL: TFloatField;
    qryBuscaBemIIBFLGPLACA: TFloatField;
    qryBuscaBemIIBLOCALNOVO: TFloatField;
    qryBuscaBemIIBCONJUNTONOVO: TFloatField;
    qryBuscaBemIIBFLGSITFISICA: TFloatField;
    qryParamDIGMASCPLACA: TFloatField;
    rdgpOper: TRadioGroup;
    edNomeArq: TEdit;
    btnSelMov: TSpeedButton;
    Label1: TLabel;
    opDlgTxt: TOpenDialog;
    qryBuscaLocal: TwwQuery;
    qryBuscaLocalIDLOCALIZACAO: TFloatField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelMovClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    atxtBens                     : TextFile;
    sLinha, sPath, sPathOriginal : String;
    iDigMascPlaca                : Integer;
    //------------------------------------------------------------------------------------
    procedure ProcessaTransmissao;
    procedure ProcessaRecepcao;
  end;

var
  frmInvColScwLucas7000 : TfrmInvColScwLucas7000;

implementation

{$R *.DFM}

uses uMensErro, uSistema, uDataBase, dBaseDados, fInvGeracao, fInvCadResultado,
     uAtivoFixo, fAguarde;

procedure TfrmInvColScwLucas7000.FormCreate(Sender: TObject);
begin
   inherited;
   qryBuscaConjunto.Prepare;
   qryBuscaBem.Prepare;
   qryBuscaLocal.Prepare;
   qryLancResult.Prepare;
   qryParam.Close;
   qryParam.ParambyName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
   qryParam.Open;
   iDigMascPlaca := qryParamDIGMASCPLACA.AsInteger;
   //-------------------------------------------------------------------------------------
   sPath := qryParamCDPATH.AsString;
end;
//========================================================================================
procedure TfrmInvColScwLucas7000.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if (rdgpOper.ItemIndex = 0) then
      ProcessaTransmissao
   else
      ProcessaRecepcao;
end;
//========================================================================================
procedure TfrmInvColScwLucas7000.btnSelMovClick(Sender: TObject);
begin
   inherited;
   OpDlgTxt.InitialDir := sPath;
   OpDlgTxt.Execute;
   //-------------------------------------------------------------------------------------
   edNomeArq.Text := OpDlgTxt.FileName;
end;
//========================================================================================
procedure TfrmInvColScwLucas7000.ProcessaTransmissao;
var
   iTransmite : Integer;
   sConjunto, sPlaca, sDesBem : String;

begin
   AssignFile(atxtBens, edNomeArq.Text);
   //-------------------------------------------------------------------------------------
   Rewrite(atxtBens);
   //-------------------------------------------------------------------------------------
   with frmInvGeracao do
   begin
      iTransmite := 0;
      qryDet.DisableControls;
      qryDet.First;
      while (not qryDet.EOF) do
      begin
         //-------------------------------------------------------------------------------
         // Conjunto
         //-------------------------------------------------------------------------------
         if length(qryDetDESBEM.AsString) < 2 then
            sConjunto := AtivoFixo.ComplZeros(qryDetIDCONJUNTO.AsString,2)
         else
            sConjunto := copy(qryDetIDCONJUNTO.AsString,1,2);
         //-------------------------------------------------------------------------------
         // Placa de Patrimonio
         //-------------------------------------------------------------------------------
         sPlaca  := copy(qryDetPLACA.AsString,1,(length(qryDetPLACA.AsString) - iDigMascPlaca));
         sPlaca  := AtivoFixo.ComplZeros(sPlaca,6);
         //-------------------------------------------------------------------------------
         // Descrição
         //-------------------------------------------------------------------------------
         if length(qryDetDESBEM.AsString) < 32 then
            sDesBem := qryDetDESBEM.AsString + '.'
         else
            sDesBem := copy(qryDetDESBEM.AsString,1,32);
         //-------------------------------------------------------------------------------
         // Gravação da Linha no Arquivo Texto
         //-------------------------------------------------------------------------------
         sLinha :=          sConjunto; // Conjunto
         sLinha := sLinha + sPlaca ;   // Patrimonio
         sLinha := sLinha + sDesBem;   // Descrição
         Writeln(atxtBens,trim(sLinha));
         //-------------------------------------------------------------------------
         iTransmite := iTransmite + 1;
         qryDet.Next;
      end;
      qryDet.EnableControls;
   end;
   sLinha := StringOfChar('*',40);
   Writeln(atxtBens,trim(sLinha));
   CloseFile(atxtBens);
   //-------------------------------------------------------------------------------------
   if (iTransmite > 0) then
      MsgDlg('Exportação Realizada', 'Informação', mtInformation, [mbOK], 0)
   else
      MsgDlg('Exportação não Realizada', 'Informação', mtInformation, [mbOK], 0);
end;
//========================================================================================
procedure TfrmInvColScwLucas7000.ProcessaRecepcao;
var
   iAux, iIdLocal   : Integer;
   sCCusto, sPlaca  : String;
   bTransacao       : Boolean;

begin
   AssignFile(atxtBens, edNomeArq.Text);
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   try
      //----------------------------------------------------------------------------------
      // Lê o arquivo texto de patrimônios
      //----------------------------------------------------------------------------------
      Reset(atxtBens);
      iAux := 0;
      while not eof(atxtBens) do
      begin
         ReadLn(atxtBens,sLinha);
         iAux := iAux + 1;
      end;
      frmAguarde.Apaga;
      frmAguarde.Min := 0;
      frmAguarde.Max := iAux;
      frmAguarde.Pos := 0;
      frmAguarde.Mostra('Processando dados do coletor');
      //----------------------------------------------------------------------------------
      frmInvCadResultado.qry.DisableControls;
      Reset(atxtBens);
      while not eof(atxtBens) do
      begin
         ReadLn(atxtBens,sLinha);
         frmAguarde.Pos := frmAguarde.Pos + 1;
         if (sLinha <> '') then
         begin
            sCCusto := copy(sLinha,1,5);
            sPlaca  := copy(sLinha,6,6);
            //----------------------------------------------------------------------------
            // Usando o Centro de Custo, pesquisar a localização lida no levantamento
            //----------------------------------------------------------------------------
            qryBuscaLocal.Close;
            qryBuscaLocal.ParamByName('PCCUSTO').AsString     := sCCusto;
            qryBuscaLocal.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
            qryBuscaLocal.Open;
            iIdLocal := qryBuscaLocalIDLOCALIZACAO.AsInteger;
            //----------------------------------------------------------------------------
            with frmInvCadResultado do
            begin
               qryLancResult.ParamByName('IDINVENTARIOBENS').AsInteger := qryInventBensIDINVENTARIOBENS.AsInteger;
               qryLancResult.ParamByName('IDEMPRESA').AsInteger := qryInventBensIDEMPRESA.AsInteger;
               qryLancResult.ParamByName('IIBPLACA').AsInteger := StrToInt(sPlaca);
               //-------------------------------------------------------------------------
               qryBuscaBem.Close;
               qryBuscaBem.ParamByName('IDINVENTARIOBENS').AsInteger := qryInventBensIDINVENTARIOBENS.AsInteger;
               qryBuscaBem.ParamByName('IDEMPRESA').AsInteger := qryInventBensIDEMPRESA.AsInteger;
               qryBuscaBem.ParamByName('IIBPLACA').AsInteger := strtoint(sPlaca);
               qryBuscaBem.Open;
               //-------------------------------------------------------------------------
               if (qryBuscaBemIIBLOCALATUAL.AsInteger <> iIdLocal) then
               begin
                  qryLancResult.ParamByName('IIBFLGPLACA').AsInteger  := 3;
                  qryLancResult.ParamByName('IIBLOCALNOVO').AsInteger := iIdLocal;
                  //----------------------------------------------------------------------
                  qryBuscaConjunto.Close;
                  qryBuscaConjunto.ParamByName('PIDLOCAL').AsInteger   := iIdLocal;
                  qryBuscaConjunto.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
                  qryBuscaConjunto.Open;
                  if (qryBuscaConjunto.RecordCount = 1) then
                     qryLancResult.ParamByName('IIBCONJUNTONOVO').AsInteger := qryBuscaConjuntoIDCONJUNTO.AsInteger
                  else
                     qryLancResult.ParamByName('IIBCONJUNTONOVO').Clear;
               end else
               begin
                  qryLancResult.ParamByName('IIBFLGPLACA').AsInteger  := 1;
                  qryLancResult.ParamByName('IIBLOCALNOVO').AsInteger := qryBuscaBemIIBLOCALATUAL.AsInteger;
                  qryLancResult.ParamByName('IIBCONJUNTONOVO').AsInteger := qryBuscaBemIIBCONJUNTOATUAL.AsInteger;
               end;
               //-------------------------------------------------------------------------
               qryLancResult.ParamByName('IIBFLGSITFISICA').AsInteger := 0;
               qryLancResult.ExecSQL;
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
   except
      if bTransacao then
         RollBackTransacao;
   end;
   //-------------------------------------------------------------------------------------
   frmInvCadResultado.qry.EnableControls;
   frmAguarde.Apaga;
   //-------------------------------------------------------------------------------------
   CloseFile(atxtBens);
end;
//========================================================================================
procedure TfrmInvColScwLucas7000.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryBuscaBem.Close;
   qryBuscaLocal.Close;
   qryBuscaConjunto.Close;
   qryParam.Close;
   qryBuscaBem.UnPrepare;
   qryBuscaLocal.UnPrepare;
   qryBuscaConjunto.UnPrepare;
   qryParam.UnPrepare;
   qryLancResult.UnPrepare;
end;

end.


