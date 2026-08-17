unit fMTInvColScwLucas7000;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, IvDictio, IvMulti, MAHlpBtn, IvEMulti,
  Buttons, TB97Tlbr, TB97, Db, DBTables, Wwquery,
  uCMTypes, uCtrlPadroes, uCtrlInventarioBens, uCtrlParamCAF, DBClient, uCMClientDataSet,
  uCmSqlParams;

type
  TfrmMTInvColScwLucas7000 = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    pnlOperacao: TPanel;
    rdgpOper: TRadioGroup;
    edNomeArq: TEdit;
    btnSelMov: TSpeedButton;
    Label1: TLabel;
    opDlgTxt: TOpenDialog;
    cdsDet: TCMClientDataSet;
    cdsBuscaLocal: TCMClientDataSet;
    sqlBuscaLocal: TCMSqlParams;
    cdsBuscaConjunto: TCMClientDataSet;
    sqlBuscaConjunto: TCMSqlParams;
    cdsBuscaBem: TCMClientDataSet;
    sqlBuscaBem: TCMSqlParams;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelMovClick(Sender: TObject);
  private
    { Private declarations }
    InventarioBens : TCtrlInventarioBens;
    ParamCAf       : TCtrlParamCAF;
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
  frmMTInvColScwLucas7000 : TfrmMTInvColScwLucas7000;

implementation

{$R *.DFM}

uses uMensErro, uSistema, fMTInvGeracao, fMTInvRegResultado, fAguarde;

procedure TfrmMTInvColScwLucas7000.FormCreate(Sender: TObject);
begin
   inherited;
   InventarioBens := TCtrlInventarioBens.Create;
   InventarioBens.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   ParamCAF.CarregaProp(Sistema.IdEmpresa);
   iDigMascPlaca := ParamCAF.DIGMASCPLACA;
   sPath := ParamCAF.CDPATH;
end;
//========================================================================================
procedure TfrmMTInvColScwLucas7000.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if rdgpOper.ItemIndex = 0 then
      ProcessaTransmissao
   else
      ProcessaRecepcao;
end;
//========================================================================================
procedure TfrmMTInvColScwLucas7000.btnSelMovClick(Sender: TObject);
begin
   inherited;
   OpDlgTxt.InitialDir := sPath;
   OpDlgTxt.Execute;
   //-------------------------------------------------------------------------------------
   edNomeArq.Text := OpDlgTxt.FileName;
end;
//========================================================================================
procedure TfrmMTInvColScwLucas7000.ProcessaTransmissao;
var
   iTransmite : Integer;
   sConjunto, sPlaca, sDesBem : String;

begin
   frmMTInvGeracao.cdsDet := cdsDet;
   //-------------------------------------------------------------------------------------
   AssignFile(atxtBens, edNomeArq.Text);
   //-------------------------------------------------------------------------------------
   Rewrite(atxtBens);
   //-------------------------------------------------------------------------------------
   iTransmite := 0;
   cdsDet.First;
   while not cdsDet.EOF do
   begin
      //----------------------------------------------------------------------------------
      // Conjunto
      //----------------------------------------------------------------------------------
      if length(cdsDet.FieldByName('DESBEM').AsString) < 2 then
         sConjunto := InventarioBens.ComplZeros(cdsDet.FieldByName('IDCONJUNTO').AsString,2)
      else
         sConjunto := copy(cdsDet.FieldByName('IDCONJUNTO').AsString,1,2);
      //----------------------------------------------------------------------------------
      // Placa de Patrimonio
      //----------------------------------------------------------------------------------
      sPlaca  := copy(cdsDet.FieldByName('PLACA').AsString,1,(length(cdsDet.FieldByName('PLACA').AsString) - iDigMascPlaca));
      sPlaca  := InventarioBens.ComplZeros(sPlaca,6);
      //----------------------------------------------------------------------------------
      // Descrição
      //----------------------------------------------------------------------------------
      if length(cdsDet.FieldByName('DESBEM').AsString) < 32 then
         sDesBem := cdsDet.FieldByName('DESBEM').AsString + '.'
      else
         sDesBem := copy(cdsDet.FieldByName('DESBEM').AsString,1,32);
      //----------------------------------------------------------------------------------
      // Gravação da Linha no Arquivo Texto
      //----------------------------------------------------------------------------------
      sLinha :=          sConjunto; // Conjunto
      sLinha := sLinha + sPlaca ;   // Patrimonio
      sLinha := sLinha + sDesBem;   // Descrição
      Writeln(atxtBens,trim(sLinha));
      //----------------------------------------------------------------------------------
      iTransmite := iTransmite + 1;
      cdsDet.Next;
   end;
   sLinha := StringOfChar('*',40);
   Writeln(atxtBens,trim(sLinha));
   CloseFile(atxtBens);
   //-------------------------------------------------------------------------------------
   if iTransmite > 0 then
      MsgDlg('Exportação Realizada', 'Informação', mtInformation, [mbOK], 0)
   else
      MsgDlg('Exportação não Realizada', 'Informação', mtInformation, [mbOK], 0);
end;
//========================================================================================
procedure TfrmMTInvColScwLucas7000.ProcessaRecepcao;
var
   iAux, iIdLocal                       : Integer;
   sCCusto, sPlaca                      : String;
   fIDINVENTARIOBENS, fIDEMPRESA,
   fIIBPLACA, fIIBFLGPLACA,
   fIIBLOCALNOVO, fIIBCONJUNTONOVO,
   fIIBFLGSITFISICA                     : Extended;

begin
   AssignFile(atxtBens, edNomeArq.Text);
   //-------------------------------------------------------------------------------------
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
      Reset(atxtBens);
      while not eof(atxtBens) do
      begin
         ReadLn(atxtBens,sLinha);
         frmAguarde.Pos := frmAguarde.Pos + 1;
         if sLinha <> '' then
         begin
            sCCusto := copy(sLinha,1,5);
            sPlaca  := copy(sLinha,6,6);
            //----------------------------------------------------------------------------
            // Usando o Centro de Custo, pesquisar a localização lida no levantamento
            //----------------------------------------------------------------------------
            sqlBuscaLocal.Prepare;
            sqlBuscaLocal.ParamByName('CODCENTROCUSTO').AsString := sCCusto;
            sqlBuscaLocal.ParamByName('IDEMPRESA').AsFloat      := Sistema.IdEmpresa;
            sqlBuscaLocal.Open;
            iIdLocal := cdsBuscaLocal.FieldbyName('IDLOCALIZACAO').AsInteger;
            //----------------------------------------------------------------------------
            fIDINVENTARIOBENS := frmMTInvRegResultado.cds.FieldbyName('IDINVENTARIOBENS').AsFloat;
            fIDEMPRESA        := frmMTInvRegResultado.cds.FieldbyName('IDEMPRESA').AsFloat;
            fIIBPLACA         := StrToFloat(sPlaca);
            //----------------------------------------------------------------------------
            sqlBuscaBem.Prepare;
            sqlBuscaBem.ParamByName('IDINVENTARIOBENS').AsFloat := fIDINVENTARIOBENS;
            sqlBuscaBem.ParamByName('IDEMPRESA').AsFloat        := fIDEMPRESA       ;
            sqlBuscaBem.ParamByName('IIBPLACA').AsFloat         := fIIBPLACA        ;
            sqlBuscaBem.Open;
            //----------------------------------------------------------------------------
            if cdsBuscaBem.FieldbyName('IIBLOCALATUAL').AsInteger <> iIdLocal then
            begin
               fIIBFLGPLACA  := 3;
               fIIBLOCALNOVO := iIdLocal;
               //-------------------------------------------------------------------------
               sqlBuscaConjunto.Prepare;
               sqlBuscaConjunto.ParamByName('IDLOCALIZACAO').AsInteger := iIdLocal;
               sqlBuscaConjunto.ParamByName('IDPESSOA').AsInteger      := Sistema.IdEmpresa;
               sqlBuscaConjunto.Open;
               if cdsBuscaConjunto.RecordCount = 1 then
               begin
                  fIIBCONJUNTONOVO := cdsBuscaConjunto.FieldByName('IDCONJUNTO').AsFloat
               end else
               begin
                  fIIBCONJUNTONOVO := -1;
               end;
            end else
            begin
               fIIBFLGPLACA     := 1;
               fIIBLOCALNOVO    := cdsBuscaBem.FieldByName('IIBLOCALATUAL').AsInteger;
               fIIBCONJUNTONOVO := cdsBuscaBem.FieldByName('IIBCONJUNTOATUAL').AsInteger;
            end;
            fIIBFLGSITFISICA := 0;
            //----------------------------------------------------------------------------
            // Registra o resultado no banco de dados
            //----------------------------------------------------------------------------
            if not InventarioBens.AplicaImportacaoResultado(fIDEMPRESA, fIDINVENTARIOBENS, fIIBPLACA,
                                                            fIIBFLGPLACA, fIIBLOCALNOVO, fIIBCONJUNTONOVO,
                                                            fIIBFLGSITFISICA) then
               Raise Exception.Create(InventarioBens.MessageInfo)
         end;
      end;
      MsgDlg('Importação Realizada!', 'Informação', mtInformation, [mbOK], 0)
   except
      On E : Exception Do
      begin
         MsgDlg('Importação não Realizada! Placa ' + sPlaca + #13 + #13 +
                'Causa : ' + E.Message,
                'Erro ', mtError, [mbOk], 0);
      end;
   end;
   frmAguarde.Apaga;
   //-------------------------------------------------------------------------------------
   CloseFile(atxtBens);
end;
//========================================================================================
procedure TfrmMTInvColScwLucas7000.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   InventarioBens.Free;
   ParamCAF.Free;
end;

end.


