unit FCadBaixaManual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  mProposta, wwdblook, CMDBLookupCombo, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, Mask, DBCtrls, uCMTypes, uCtrlContratoImovel,
  UComunsImobiliarioDB ,uCMClientDataSet,
   // Helen - SOL: 172902/8221 KTN: 1577344
  uCtrlContab;

type
  TfrmCadBaixaManual = class(TFrmCadastroGridCS)
    Panel1: TPanel;
    Label1: TLabel;
    edtComprador: TEdit;
    Label2: TLabel;
    dblcCondPag: TCMDBLookupCombo;
    qryCondPag: TwwQuery;
    qryCondPagIDCONTRATOIMOVEL: TFloatField;
    qryCondPagIDCONDPAGIMOVEL: TFloatField;
    Label3: TLabel;
    edDataPag: TCMDateTimePicker;
    Label4: TLabel;
    edVlrPag: TDBRealEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtNumProp: TEdit;
    edtNomProp: TEdit;
    qryCondPagDSCCOND: TStringField;
    qryIDPARCFINANCIMOV: TFloatField;
    qryIDCONDPAGIMOVEL: TFloatField;
    qryDATAVENCIMENTO: TDateTimeField;
    qryVLRPRESTACAO: TFloatField;
    qryVLRPAGO: TFloatField;
    qryFLGTIPOLANC: TFloatField;
    qryFLGLANCINTEGRA: TFloatField;
    qryDATAPAGAMENTO: TDateTimeField;
    qryCAL_TIPO: TStringField;
    qryNUMPARCELA: TStringField;
    Label7: TLabel;
    DBRealEdit1: TDBRealEdit;
    Label8: TLabel;
    Label9: TLabel;
    CMDateTimePicker1: TCMDateTimePicker;
    Label10: TLabel;
    DBRealEdit2: TDBRealEdit;
    DBEdit1: TDBEdit;
    qryIDCIDADES: TFloatField;
    qryIDPAIS: TFloatField;
    qryCODESTADO: TStringField;
    qryDATALIMITE: TDateTimeField;
    qryVLRCORRIGIDOATRASO: TFloatField;
    qryVLRMULTAATRASO: TFloatField;
    qryVLRMORAATRASO: TFloatField;
    qryFLGCONCILIADO: TStringField;
    qryVLRPRESTCORRIG: TFloatField;
    qryVLRMULTACORRIG: TFloatField;
    qryVLRJUROSCORRIG: TFloatField;
    qryCondPagIDCONDINICIAL: TFloatField;
    qryIDCONTRATOIMOVEL: TFloatField;
    qryIDDOCDIVERGE: TFloatField;
    procedure CmeCadastroFind(Sender: TObject);
    procedure dblcCondPagCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure qryCalcFields(DataSet: TDataSet);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure dbGrdCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbGrdTopRowChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    sFiltroInd  : String;
    ctrlContratoImovel : TCtrlContratoImovel;
    ComunsImobiliarioDB : TComunsImobiliarioDB;
    CtrlContab   : TCtrlContab; // Helen - SOL: 172902/8221 KTN: 1577344
    procedure Sel(n : Double);
    function  CalculaAtraso : Boolean;


  public
    { Public declarations }
  end;

var
  frmCadBaixaManual: TfrmCadBaixaManual;


implementation
{$R *.DFM}
uses uMensErro, uDataBase, DFinanciamento, UDiasInUteis,
     uCalcDocumento, DCalcDocumento, UFuncoesImob, UFuncAlienacao,
     uComunsImobiliario, uSistema, dBaseDados, dMS;

procedure TfrmCadBaixaManual.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then begin
      Sel(StrToFloat(MontaSelect.ValoresChave[0]));
      edtNumProp.Text   := MontaSelect.ValoresChave[1];
      edtNomProp.Text   := MontaSelect.ValoresChave[2];
      edtComprador.Text := MontaSelect.ValoresChave[3];
   end;

end;

procedure TfrmCadBaixaManual.Sel(n: Double);
begin
   LimpaParametros(qryCondPag);
   qryCondPag.Params[0].AsFloat := n;
   qryCondPag.Open;

   LimpaParametros(qry);
   qry.Open;
end;

procedure TfrmCadBaixaManual.dblcCondPagCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   LimpaParametros(qry);
   qry.Params[0].AsFloat := qryCondPagIDCONDINICIAL.AsInteger;
   qry.Open;

   if qry.IsEmpty then begin
      CmeCadastro.Operacao := opVazio;
   end else begin
      CmeCadastro.Operacao := opIdle;
   end;
   CmeCadastro.AtualizaBotoes(Self);
   dbGrd.SetFocus;
end;

procedure TfrmCadBaixaManual.CmeCadastroConfirma(Sender: TObject);
begin
   if qryDATAPAGAMENTO.IsNull then begin
      qryFLGLANCINTEGRA.AsInteger := 0;
      qryDATALIMITE.Clear;
      qryVLRCORRIGIDOATRASO.Clear;
      qryVLRMULTAATRASO.Clear;
      qryVLRMORAATRASO.Clear;
      qryVLRPAGO.Clear;
      qryFLGCONCILIADO.Clear;
      qryVLRMULTACORRIG.Clear;
      qryVLRPRESTCORRIG.Clear;
      qryVLRJUROSCORRIG.Clear;
   end else begin
      if qryFLGLANCINTEGRA.AsInteger in[5,6] then begin
         qryFLGCONCILIADO.AsString := 'S';
         qryVLRCORRIGIDOATRASO.Clear;
         qryVLRMULTAATRASO.Clear;
         qryVLRMORAATRASO.Clear;
         qryVLRMULTACORRIG.Clear;
         qryVLRPRESTCORRIG.Clear;
         qryVLRJUROSCORRIG.Clear;
         // Apaga o motivo anterior para limpar sujeiras ( caso o documento original tenha mudado no CAR )
         CalcDocumento.ApagarMotivoConciliacao(-1, qryIDPARCFINANCIMOV.AsInteger, 'R');
         // Grava o motivo de conciliação
         CalcDocumento.GravarMotivoConciliacao(-1, qryIDPARCFINANCIMOV.AsInteger, Sistema.IdUsuario, -1, -1,
                                               null, 0, 'Repactuação Contratual', 'R');
      end else begin
         qryFLGLANCINTEGRA.AsInteger := 3;
         if CalculaAtraso = True then begin
            qryFLGCONCILIADO.AsString := 'S';
         end else begin
            qryFLGCONCILIADO.Clear;
         end;
      end;
   end;

   // Apaga o motivo da conciliação
   CalcDocumento.ApagarMotivoConciliacao(-1, qryIDPARCFINANCIMOV.AsInteger, 'A');

   inherited;
   dblcCondPag.Enabled := True;
end;

procedure TfrmCadBaixaManual.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  dblcCondPag.Enabled := True;
end;

procedure TfrmCadBaixaManual.sbtnAlterarClick(Sender: TObject);
begin
   if ( (qryFLGLANCINTEGRA.AsInteger in [0,3,4]) or
        (qryFLGLANCINTEGRA.AsInteger in [5,6]) and (qryCondPagIDCONTRATOIMOVEL.AsInteger = 1513) and
        (Sistema.TipoCliente = 19991) ) then begin
      inherited;
   end else begin
      MsgDlg('As Parcelas integradas pelo sistema não podem ser alteradas manualmente','Erro',mtError,[mbOK],0);
      sbtnAlterar.Down := False;
   end;
end;

procedure TfrmCadBaixaManual.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   Accept := True;

   if (not qryDATAPAGAMENTO.isNull) and (qryVLRPAGO.AsFloat = 0) then begin
      MsgDlg('Valor pago não pode ser zero','Erro',mtError,[mbOK],0);
      Accept := False;
      edVlrPag.SetFocus;
      Exit;
   end;

   if (qryDATAPAGAMENTO.IsNull) and (qryVLRPAGO.AsFloat > 0) then begin
      MsgDlg('Data de Pagamento deve ser preenchida','Erro',mtError,[mbOK],0);
      Accept := False;
      edDataPag.SetFocus;
      Exit;
   end;

   if (not qryIDDOCDIVERGE.IsNull) then begin
      MsgDlg('Esta Parcela já foi conciliada e gerou um documento' + #13 +
             'no Contas a Receber. É necessário primeiro desfazer' + #13 +
             'a integração deste documento com o Contas a Receber.','Aviso',mtWarning,[mbOK],0);
      Accept := False;
      Exit;
   end;
   // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
   if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edDataPag.Text) then
   begin
      Accept := False;
      edDataPag.SetFocus;
      Exit;
   end;
   // Helen - SOL: 172902/8221 KTN: 1577344 - Fim
end;


procedure TfrmCadBaixaManual.qryCalcFields(DataSet: TDataSet);
begin
   inherited;
   qryCAL_TIPO.AsString := FuncAlienacao.TipoParcela(qryFLGTIPOLANC.AsInteger,
                                                     qryFLGLANCINTEGRA.AsInteger);
end;

function TfrmCadBaixaManual.CalculaAtraso : Boolean;
var dDataLimite : TDateTime;
    fCM, fMulta, fJuros, fVlrDevido : Double;
    iUsaMesAnterior : Integer;
    cdsTemp : TCMClientDataSet;
begin
   Result := True;

// Início ------- Data: 08/01/2004 ----- Marcio Motta ----- Pendência: 15799 ----------
//
// Foram retirados da QRY os Campos/Fields ref. Multa, Juros e Correção devido a
// criação da nova tabela CONTRATOXMULTA e utilizado um CTRL(ComunsImobiliariosDB)
// via CDS como abaixo para acesso a esses campos na nova tabela.

   cdsTemp := TCMClientDataSet.Create( nil );
   cdsTemp.Data := ctrlContratoImovel.BuscaParamCMJurosMulta(qryIDCONTRATOIMOVEL.AsFloat, qryDATAVENCIMENTO.AsDateTime);

   // Se não existir Vigência cadastrada ou possuir mais de uma vigência para o período
   // sai da rotina informando mensagem de erro de uCtrlContratoImovel
   if (cdsTemp.IsEmpty) or (cdsTemp.RecordCount > 1) then begin
      Result := False;
      qryDATAPAGAMENTO.Clear;
      qryVLRPAGO.Clear;
      EXIT;
   end;

   // Calcula data limite para pagamento
   dDataLimite := ComunsImobiliarioDB.DataLimite(qryDATAVENCIMENTO.AsDateTime,
                                                 qryIDCIDADES.AsInteger,
                                                 qryIDPAIS.AsInteger,
                                                 cdsTemp.FieldByName('DIASTOLERANCIA').AsInteger,
                                                 cdsTemp.FieldByName('DIASREPASSE').AsInteger,
                                                 qryCODESTADO.AsString,
                                                 cdsTemp.FieldByName('FLGTIPODIATOLERA').AsString,
                                                 cdsTemp.FieldByName('FLGTIPODIAREPASS').AsString,
                                                 True, False, False);
   // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
   if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,DateToStr(dDataLimite)) then
   begin
       MsgDlg('Período contábil bloqueado - Data Limite.','Aviso',mtWarning,[mbOk],0);
       Result := False;
       Exit;
   end;
   // Helen - SOL: 172902/8221 KTN: 1577344 - Fim
   // Determina valor para cobrança de multa
   if qryDATAPAGAMENTO.AsDateTime > dDataLimite then
        fVlrDevido := qryVLRPRESTACAO.AsFloat
   else fVlrDevido := qryVLRPRESTACAO.AsFloat - qryVLRPAGO.AsFloat;
   if fVlrDevido < 0 then fVlrDevido := 0;

   // Determina se utiliza o indice de correção do mes anterior
   iUsaMesAnterior := cdsTemp.FieldByName('MESREFCORRECAO').AsInteger;

   // Calcula multa, juros e correção para pagamentos em atraso
   if (qryDATAPAGAMENTO.AsDateTime > dDataLimite) or ((fVlrDevido > 0) and (qryVLRPAGO.AsFloat > 0)) then begin
      fCM := Arredonda(
             ComunsImobiliarioDB.CalcCM(qryVLRPRESTACAO.AsFloat ,
                                        cdsTemp.FieldByName('IDINDCORRECAO').AsInteger,
                                        qryDATAVENCIMENTO.AsDateTime + 1,
                                        qryDATAPAGAMENTO.AsDateTime, True, iUsaMesAnterior ), 2);

      fMulta := Arredonda(
                ComunsImobiliarioDB.CalcMulta(-1,   // Baixa manual não tem documento
                                              fVlrDevido,fCM,
                                              cdsTemp.FieldByName('VLRMULTA').AsFloat,
                                              cdsTemp.FieldByName('PERCMULTA').AsFloat,
                                              cdsTemp.FieldByName('MOEDAMULTA').AsInteger,
                                              qryDATAPAGAMENTO.AsDateTime,
                                              qryDATAPAGAMENTO.AsDateTime,
                                              Date), 2);

      fJuros := Arredonda(
                ComunsImobiliarioDB.CalcJuros(qryVLRPRESTACAO.AsFloat + fCM,
                                              cdsTemp.FieldByName('VLRJUROS').AsFloat,
                                              cdsTemp.FieldByName('PERCJUROS').AsFloat,
                                              cdsTemp.FieldByName('MOEDAJUROS').AsInteger,
                                              cdsTemp.FieldByName('PERIODOJUROS').AsString,
                                              qryDATAVENCIMENTO.AsDateTime + 1,
                                              qryDATAPAGAMENTO.AsDateTime,
                                              cdsTemp.FieldByName('FLGJUROSPROPORC').AsString = 'S'), 2);

// Fim ------------------------------ Marcio Motta -----------------------------

   end else begin
      fCM    := 0;
      fJuros := 0;
      fMulta := 0;
   end;

   // Grava dados do atraso na parcela
   qryDATALIMITE.AsDateTime      := dDataLimite;
   qryVLRCORRIGIDOATRASO.AsFloat := qryVLRPRESTACAO.AsFloat + fCM;
   qryVLRMULTAATRASO.AsFloat     := fMulta;
   qryVLRMORAATRASO.AsFloat      := fJuros;
   qryVLRMULTACORRIG.Clear;
   qryVLRPRESTCORRIG.Clear;
   qryVLRJUROSCORRIG.Clear;

   if (qryVLRPRESTACAO.AsFloat + fCM + fJuros + fMulta) <> qryVLRPAGO.AsFloat then begin
      Result := False;
   end;
end;

procedure TfrmCadBaixaManual.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   if qryDATAPAGAMENTO.IsNull then begin
      qryDATAPAGAMENTO.AsDateTime := qryDATAVENCIMENTO.AsDateTime;
      qryVLRPAGO.AsFloat          := qryVLRPRESTACAO.AsFloat;
   end;
   edDataPag.SetFocus;
end;

procedure TfrmCadBaixaManual.dbGrdCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWindow;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;

procedure TfrmCadBaixaManual.dbGrdTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmCadBaixaManual.FormCreate(Sender: TObject);
begin
  inherited;
// Início ------- Data: 08/01/2004 ----- Marcio Motta ----- Pendência: 15799 ----------
  ctrlContratoImovel := TCtrlContratoImovel.Create( Sistema.IdEmpresa,
                                                    Sistema.IdModulo,
                                                    Sistema.IdUsuario,
                                                    Sistema.IdEspAcesso,
                                                    Sistema.UsaPlanoPatro );

  ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IDEmpresa, Sistema.IDModulo, Sistema.IDUsuario, sistema.IDEspAcesso, Sistema.UsaPlanoPatro);

  ctrlContratoImovel.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                                 Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                                 ComunsImobiliario.MensErroMT);

  ComunsImobiliarioDB.InitializeAs(ctrlContratoImovel);
// Fim ------------------------ Marcio Motta -----------------------------------


   sFiltroInd := MontaSelect.Filtro.Text;
   MontaSelect.Filtro.Add('CONTRATOIMOVEL.FLGSTATUS = ''V''');
   // Helen - SOL: 172902/8221 KTN: 1577344
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(ComunsImobiliarioDB);

end;

procedure TfrmCadBaixaManual.FormDestroy(Sender: TObject);
begin
// Início ------- Data: 08/01/2004 ----- Marcio Motta ----- Pendência: 15799 ----------
  FreeAndNil(ctrlContratoImovel);
  FreeAndNil(ComunsImobiliarioDB);
  inherited;
// Fim ------------------------ Marcio Motta -----------------------------------
  FreeAndNil(CtrlContab); // Helen - SOL: 172902/8221 KTN: 1577344
end;

procedure TfrmCadBaixaManual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  MontaSelect.Filtro.Text := sFiltroInd;
end;

end.

