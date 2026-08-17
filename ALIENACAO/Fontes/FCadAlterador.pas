{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
//Rotina......: -
//Nº SOL......: 172902/8221
//Nº KINTANA..: 1577344
//Data........: 20/03/2012
//Responsável.: Helen V. Bianchi
//Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
// -----------------------------------------------------------------------------
// SOl_Kintana : 158541_1288222
// Data        : 30.05.2011
// Analista    : Ricardo de Freitas Araújo
// Descrição   : Ao lancar um alterador, verifica se o saldo do documento fica
//               negativo e exibe uma tela de confirmação.
// -----------------------------------------------------------------------------
// Pendência   : 22149
// Responsável : Daniel Simões
// Data        : 25/04/2006
// Descrição   : Ao selecionar o alterador, já traz marcado para não integrar
//               com o contábil quando estiver ligada a parametrização de
//               operação diária e o alterador selecionado for o mesmo para
//               atualização de inadimplencia cadastrado para o tipo de imóvel...
// ----------------------------------------------------------------------------}

unit FCadAlterador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  Mask, wwdbedit, TREdit, wwdbdatetimepicker, CMDateTimePicker, TEdNum,
  wwdblook, FCadastroGridCS, Provider, DBClient, uCMClientDataSet, uCtrlPadroes, uModuloImobiliario,
  uCtrlParamIntegra, uCtrlImobDocumento, uCtrlImobLancamento, //uCtrlDocumento, uCtrlLancamento;
  // Helen - SOL: 172902/8221 KTN: 1577344
  uCtrlContab;

type
  TfrmCadAlterador = class(TFrmCadastroGridMTImob)
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtNumero: TwwDBEdit;
    edtNome: TwwDBEdit;
    edtComprador: TwwDBEdit;
    edtDocumento: TwwDBEdit;
    edtParcela: TwwDBEdit;
    edtTipo: TwwDBEdit;
    edtVencto: TCMDateTimePicker;
    edtValor: TDBRealEdit;
    rdgAcreDesc: TRadioGroup;
    Label7: TLabel;
    DBcboAlterador: TwwDBLookupCombo;
    chkContabiliza: TCheckBox;
    Label10: TLabel;
    Label12: TLabel;
    edtDataLancamento: TCMDateTimePicker;
    edtVlrAlt: TDBRealEdit;
    qry: TwwQuery;
    dsp: TDataSetProvider;
    CdsCODDOCUMENTO: TFloatField;
    CdsNUMLANCTO: TFloatField;
    CdsCODALTERADOR: TFloatField;
    CdsPLNCODIGO: TFloatField;
    CdsDATALANCTO: TDateTimeField;
    CdsVALOR: TFloatField;
    CdsVALOROUTRAMOEDA: TFloatField;
    CdsDEBCRE: TStringField;
    CdsOPERACAO: TStringField;
    CdsHISTORICOCOMPL: TStringField;
    CdsDESCRICAO: TStringField;
    CdsNODOCUMENTO: TFloatField;
    edtObs: TEdit;
    Label11: TLabel;
    dsTipoAlterador: TDataSource;
    qryTipoAlterador: TQuery;
    qryTipoAlteradorCODTIPIMOVEL: TStringField;
    qryTipoAlteradorCODALTCMAL: TFloatField;
    qryTipoAlteradorCODALTJRAL: TFloatField;
    qryTipoAlteradorCODALTMTAL: TFloatField;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rdgAcreDescClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBcboAlteradorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }

    sTipoImovel : String;
    iDocumento  : Integer;

    //CtrlDocumento      : TCtrlDocumento;
    //CtrlLancamento     : TCtrlLancamento;
    CtrlDocumento      : TCtrlImobDocumento;
    CtrlLancamento     : TCtrlImobLancamento;
    CtrlContab   : TCtrlContab; // Helen - SOL: 172902/8221 KTN: 1577344

    procedure AbreAlteradores(const iDocumento: Integer);
    procedure AbreLookup;
    function  BuscaTipoImovel(const iIdContrato: Integer): String;
    function  VerificaPreenchimento: boolean;
  public
    { Public declarations }
  end;

var
  frmCadAlterador: TfrmCadAlterador;

implementation

uses uFuncAlienacao, dBaseDados, uDataBase, uMensErro, uFuncoesImob,
     dLookImobiliario, DFinanciamento, uSistema, uComunsImobiliario, uVerificaPreenchimento, 
     uIntegraBack;

{$R *.DFM}

procedure TfrmCadAlterador.AbreAlteradores(const iDocumento: Integer);
begin
   cds.Close;
   LimpaParametros(qry);
   qry.ParamByName('PCODDOCUMENTO').AsFloat := iDocumento;
   cds.Open;
end;

procedure TfrmCadAlterador.AbreLookup;
begin
   with dtmLookImobiliario.qryLookAlteradorXTipoImo do begin
      LimpaParametros(dtmLookImobiliario.qryLookAlteradorXTipoImo);
      ParamByName('PCODTIPIMOVEL').AsString     := sTipoImovel;
      ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.idEmpresa;
      ParamByName('PRECPAG').AsString           := 'R';
      case rdgAcreDesc.ItemIndex of
         0: ParamByName('PACRESDECRES').AsString   := 'D'; // Acréscimo
         1: ParamByName('PACRESDECRES').AsString   := 'C'; // Desconto
      end;
      Open;
   end;
end;

function TfrmCadAlterador.BuscaTipoImovel(const iIdContrato: Integer): String;
var sSql : String;
begin
   sSql := 'SELECT DISTINCT I.CODTIPIMOVEL ' +
           '  FROM CONTRATOIMOVEL CI, ' +
           '       CONTRATOXIMOVEL CXI, ' +
           '       IMOVEL I ' +
           ' WHERE CI.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL ' +
           '   AND CXI.IDIMOVEL = I.IDIMOVEL ' +
           '   AND CI.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato);
   FazQuery(dtmFinanciamento.qryAux, sSql);
   Result := dtmFinanciamento.qryAux.FieldByName('CODTIPIMOVEL').AsString;
end;

procedure TfrmCadAlterador.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
     edtNumero.Text    := MontaSelect.ValoresChave[1];
     edtNome.Text      := MontaSelect.ValoresChave[2];
     edtComprador.Text := MontaSelect.ValoresChave[3];
     edtDocumento.Text := MontaSelect.ValoresChave[4];
     edtParcela.Text   := Trim(MontaSelect.ValoresChave[5]) + '/' + Trim(MontaSelect.ValoresChave[6]);
     edtTipo.Text      := FuncAlienacao.TipoParcela(StrToInt(MontaSelect.ValoresChave[7]),-1);
     edtVencto.Date    := StrToDate(MontaSelect.ValoresChave[8]);
     if MontaSelect.ValoresChave[7] <> '9' then
          edtValor.Value := StrToFloat(MontaSelect.ValoresChave[9])
     else edtValor.Value := StrToFloat(MontaSelect.ValoresChave[10]);

     sTipoImovel := BuscaTipoImovel( StrToInt(MontaSelect.ValoresChave[11]) );
     iDocumento  := StrToInt(MontaSelect.ValoresChave[4]);

     // Abre tabela com alteradores
     AbreAlteradores( StrToInt(MontaSelect.ValoresChave[0]) );


// Daniel Simões - P: 22149 - 25/04/2006 - -------------------------------------
     qryTipoAlterador.Close;
     qryTipoAlterador.ParamByName('PIDCONTRATOIMOVEL').AsInteger := StrToInt(MontaSelect.ValoresChave[11]);
     qryTipoAlterador.Open;
// Daniel Simões - P: 22149 - 25/04/2006 - -------------------------------------
  end;
end;

procedure TfrmCadAlterador.FormShow(Sender: TObject);
begin
  inherited;
  dbGrd.BringToFront;
  iDocumento := -1;
  AbreAlteradores(-1);
end;

procedure TfrmCadAlterador.rdgAcreDescClick(Sender: TObject);
begin
  inherited;
  AbreLookup;
end;

function TfrmCadAlterador.VerificaPreenchimento: boolean;
begin
   Result := False;
   try
      if Trim(DBcboAlterador.Text) = '' then
         raise EValidacao.CreateVal('É necessário indicar o Alterador!', DBcboAlterador);

      if trim(edtDataLancamento.Text)= '' then
         raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', edtDataLancamento);

      // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataLancamento.Text) then
         raise EValidacao.CreateVal('Período contábil bloqueado.', edtDataLancamento);
      // Helen - SOL: 172902/8221 KTN: 1577344 - Fim

      if edtVlrAlt.Value = 0 then
         raise EValidacao.CreateVal('É necessário indicar o Valor!', edtVlrAlt);
   except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;

procedure TfrmCadAlterador.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if VerificaPreenchimento then
       Accept := True
  else Accept := False;
end;

procedure TfrmCadAlterador.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  rdgAcreDesc.ItemIndex := 0;
  DBcboAlterador.Clear;
  edtDataLancamento.Clear;
  edtVlrAlt.Clear;
  AbreLookup;
end;

procedure TfrmCadAlterador.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
var iNumLancto, iPlanilha, iAlterador : integer;
    sDataLancamento : string;

    //Ricardo Freitas SOL: 157289/5022 KINTANA: 1288999
    Natureza:integer;
    SaldoDoc,Saldo,SaldoFinal:single;
    sDebCreDoc:string;
begin
   inherited;
   if MsgDlg('Deseja realmente lançar os valores no Contas a Pagar/Receber?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      try
         StartTransacao;

         sDataLancamento := DateToStr(edtDataLancamento.Date);
         iAlterador      := StrToInt(DBcboAlterador.LookupValue);
         iPlanilha       := 0;

         //CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
         CtrlDocumento.Prepare( OpLanctoDocumImob, odlAlteradorImob );
         CtrlDocumento.OpenTransaction := False;
         CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
         CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
         CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
         CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
         CtrlDocumento.IdModulo        := Sistema.idModulo;

         CtrlDocumento.Lanctodocum.SetValues( StrToDate(sDataLancamento),
                                              iDocumento,
                                              0,
                                              edtVlrAlt.Value,
                                              0, edtVlrAlt.Value,
                                              0,
                                              iPlanilha, 0,
                                              Sistema.idUsuario,
                                              Sistema.idEmpresa,
                                              0, 0, 0, 0,
                                              iAlterador,
                                              '4', '', '', '', edtObs.Text,
                                              '', '', '',
                                              dtmLookImobiliario.qryLookAlteradorXTipoImoACRESDECRES.AsString,
                                              Sistema.idModulo,
                                              ParamIntegra.Plano,
                                              Sistema.UsaPlanoPatro,
                                              not(chkContabiliza.Checked));


         
           //Ricardo Freitas SOL: 158541 KINTANA: 1288222
           SaldoDoc := 0;
           SaldoDoc := CtrlDocumento.RetornaSaldoDocumento(IntToStr(iDocumento),sDebCreDoc);
                   
           if Trim(dtmLookImobiliario.qryLookAlteradorXTipoImo.FieldByName('ACRESDECRES').AsString) = Trim(sDebCreDoc) then
              Natureza := 1
           else
              Natureza := -1;

           SaldoFinal := 0;
           Saldo := 0;
           Saldo :=  edtVlrAlt.Value  * Natureza;  //StrToFLoat(Trim(edtValor.Text)) * Natureza;
           SaldoFinal :=  SaldoDoc + Saldo;

           if (0 > SaldoFinal ) then
           begin
               if Application.MessageBox(PChar('Realizando o lançamento deste alterador, o saldo do documento ficará negativo.' + #13 +
                                                   'Saldo do documento com este alterador: ' + FormatFloat('#,##0.00',SaldoFinal) + #13 + #13 +
                                                   'Confirma inclusão deste alterador?'),'Confirmar',36) <> 6 then
               begin
                 RollBackTransacao;
                 Accept := false;
                 Exit;
               end;
           end;
           //Ricardo Freitas - Fim

         if not CtrlDocumento.Insert then
            raise Exception.Create(CtrlDocumento.MessageInfo);
         CommitTransacao;

      except
         RollBackTransacao;
         MsgDlg('Houve erro durante a tentativa de integração com o Contas a Pagar/Receber.' +#13+
                CtrlDocumento.MessageInfo , 'Erro', mtError, [mbOk], 0);
         Raise;
      end;
   end;
end;

procedure TfrmCadAlterador.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  if iDocumento > 0 then AbreAlteradores( iDocumento );
end;

procedure TfrmCadAlterador.CmeCadastroDelete(Sender: TObject);
var iNumeroLancto      : integer;
    iPlanilhaAEstornar : integer;
begin
   if ( (cds.Active) and (not(cds.isEmpty)) ) then begin
      StartTransacao;
      try
         // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
         if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,CdsDATALANCTO.asString) then
         begin
             MsgDlg('Período contábil bloqueado.','Aviso',mtWarning,[mbOk],0);
             abort;
         end;
         // Helen - SOL: 172902/8221 KTN: 1577344 - Fim
         iNumeroLancto        := CdsNUMLANCTO.AsInteger;
         iDocumento           := cdsCODDOCUMENTO.AsInteger;
         iPlanilhaAEstornar   := cdsPLNCODIGO.AsInteger;

         // Some com o LancToDocum e desfaz a contabilização se houver
         //CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
         CtrlDocumento.Prepare(OpLanctoDocumImob, odlAlteradorImob);
         CtrlDocumento.OpenTransaction       := False;
         CtrlDocumento.UsaPlanoPatro         := Sistema.UsaPlanoPatro;
         CtrlDocumento.CodDocumento          := iDocumento;
         CtrlDocumento.Lanctodocum.NumLancto := iNumeroLancto;

         CtrlDocumento.Delete;

          CtrlLancamento.OpenTransaction := False;
          CtrlLancamento.ExcluiLancaContab( Sistema.idUsuario,
                                            iPlanilhaAEstornar,
                                            Sistema.idModulo, 0,
                                            Sistema.UsaPlanoPatro, True);

         CommitTransacao;
         MsgDlg('Alterador excluído com sucesso', 'Informação', mtInformation, [mbOk], 0);
         inherited;
      except
         RollBackTransacao;
         Raise;
      end;
   end;
end;

procedure TfrmCadAlterador.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  if iDocumento > 0 then AbreAlteradores( iDocumento );
end;

procedure TfrmCadAlterador.sbtnInserirClick(Sender: TObject);
begin
   if iDocumento > 0 then begin
      inherited;
   end else begin
      MsgDlg('Selecione primeiro o Documento', 'Aviso', mtWarning, [mbOk], 0);
      sbtnInserir.Down := False;
   end;
end;

procedure TfrmCadAlterador.FormCreate(Sender: TObject);
begin
   inherited;
   //CtrlDocumento       := TCtrlDocumento.Create;
   //CtrlLancamento      := TCtrlLancamento.Create;
   CtrlDocumento       := TCtrlImobDocumento.Create;
   CtrlLancamento      := TCtrlImobLancamento.Create;
   CtrlDocumento.InitializeAs( Padroes );
   CtrlLancamento.InitializeAs( Padroes );
   // Helen - SOL: 172902/8221 KTN: 1577344
   CtrlContab := TCtrlContab.Create;
   CtrlContab.InitializeAs(Padroes);
end;



procedure TfrmCadAlterador.FormDestroy(Sender: TObject);
begin
   FreeAndNil(CtrlDocumento);
   FreeAndNil(CtrlLancamento);
   FreeAndNil(CtrlContab); // Helen - SOL: 172902/8221 KTN: 1577344
   inherited;
end;



procedure TfrmCadAlterador.DBcboAlteradorCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
// Daniel Simões - P: 22149 - 25/04/2006 - Início ------------------------------
     if ( (ModuloImobiliario.Alienacao.iTipoOperAtualCM    > 0) or
          (ModuloImobiliario.Alienacao.iTipoOperAtualJuros > 0) or
          (ModuloImobiliario.Alienacao.iTipoOperAtualMulta > 0) ) then begin

       if ( (dtmLookImobiliario.qryLookAlteradorXTipoImo.FieldByName('CODALTERADOR').AsInteger =
             qryTipoAlterador.FieldByName('CODALTCMAL').AsInteger) or
            (dtmLookImobiliario.qryLookAlteradorXTipoImo.FieldByName('CODALTERADOR').AsInteger =
             qryTipoAlterador.FieldByName('CODALTJRAL').AsInteger) or
            (dtmLookImobiliario.qryLookAlteradorXTipoImo.FieldByName('CODALTERADOR').AsInteger =
             qryTipoAlterador.FieldByName('CODALTMTAL').AsInteger) ) then
         chkContabiliza.Checked := True else chkContabiliza.Checked := False;
     end;
// Daniel Simões - P: 22149 - 25/04/2006 - Fim ---------------------------------
end;

end.
