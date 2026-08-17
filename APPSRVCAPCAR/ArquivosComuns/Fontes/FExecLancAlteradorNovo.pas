unit FExecLancAlteradorNovo;

//	-------------------------------------------------------------------------------------------------
//
//	   Lançamento de Alteradores (--> nova integração)
//
//	Autor             :  André Pontes
//	Data de Início    :	20/11/2000
//	Data de Término   :  21/11/2000
//
//	Modificações      :  22/11/2000  1) Lógica refeita em função de alterações na Integração (IDDOCUMENTO)
//                           28/04/2001  2) qryLancImovel local, não mais do dtmLookImobiliario
//                           30/09/2004  3) Pend. 17787 - Vinicius - Inclusão de Observações
//
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, ExtCtrls, Db, DBTables, wwdblook, Grids, Wwdbigrd, Wwdbgrid,
  MontaSelect, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, Mask,
  DBCtrls, Wwdatsrc, TEdNum, TB97Ctls, Wwquery, wwdbdatetimepicker, CMDateTimePicker,
  FSairAjudaImob, uCtrlDocumento, uCtrlParamIntegra, uModuloImobiliario;

type
  TfrmExecLancAlteradorNovo = class(TfrmSairAjudaImob)
    qryAlteradoresLanc: TwwQuery;
    dsAlteradoresLanc: TwwDataSource;
    qryAlteradoresLancCODDOCUMENTO: TFloatField;
    qryAlteradoresLancNUMLANCTO: TFloatField;
    qryAlteradoresLancCODALTERADOR: TFloatField;
    qryAlteradoresLancPLNCODIGO: TFloatField;
    qryAlteradoresLancDATALANCTO: TDateTimeField;
    qryAlteradoresLancVALOR: TFloatField;
    qryAlteradoresLancVALOROUTRAMOEDA: TFloatField;
    qryAlteradoresLancDEBCRE: TStringField;
    qryAlteradoresLancOPERACAO: TStringField;
    qryAlteradoresLancHISTORICOCOMPL: TStringField;
    qryAlteradoresLancDESCRICAO: TStringField;
    qryAlteradoresLancNODOCUMENTO: TFloatField;
    ds: TwwDataSource;
    Label2: TLabel;
    Label12: TLabel;
    Label1: TLabel;
    Bevel1: TBevel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label4: TLabel;
    rdgAcreDesc: TRadioGroup;
    DBcboAlterador: TwwDBLookupCombo;
    DBgrdAlteradoresLanc: TwwDBGrid;
    edtDataLancamento: TCMDateTimePicker;
    edtValor: TEditNum;
    chkContabiliza: TCheckBox;
    DBgrdReajuste: TwwDBGrid;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit1: TDBEdit;
    Panel3: TPanel;
    Panel1: TPanel;
    btnProcurar: TBitBtn;
    bbtnConfirmar: TBitBtn;
    btnExcluiAlterador: TBitBtn;
    Label3: TLabel;
    edtObs: TEdit;

    procedure rdgAcreDescClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluiAlteradorClick(Sender: TObject);
    procedure DBgrdAlteradoresLancCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure DBcboAlteradorCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure DBgrdAlteradoresLancTopRowChanged(Sender: TObject);
    procedure DBgrdReajusteCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdReajusteTopRowChanged(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);


  private { Private declarations }
    iDocumento       : integer;
    iAlterador       : integer;
    sFiltroMS        : string;
    sTipoImovel      : string;
    sRecPag          : string;

    CtrlDocumento    : TCtrlDocumento;
    CtrlParamIntegra : TCtrlParamIntegra;

    function VerificaPreenchimento: boolean;

    procedure AbreQueries;
    procedure FechaQueries;

  public { Public declarations }

  end;



var
  frmExecLancAlteradorNovo: TfrmExecLancAlteradorNovo;



implementation
{$R *.DFM}
uses
   uModulo, uMensErro, uSistema, uDataBase, uData, uFuncaoGeral, uDiasInUteis,
   UComunsImobiliario, uVerificaPreenchimento, uIntegraBack, uLancContab,
   dLookImobiliario, dImobiliario, uFuncoesImob, DMS, dLancImovel, dBaseDados;



procedure TfrmExecLancAlteradorNovo.rdgAcreDescClick(Sender: TObject);
begin
   inherited;
   AbreQueries;
end;



procedure TfrmExecLancAlteradorNovo.FormShow(Sender: TObject);
begin
   inherited;
   AbreQueries;
end;



procedure TfrmExecLancAlteradorNovo.FormCreate(Sender: TObject);
begin
   inherited;

   // Adiciona o filtro de EmpresaProp ao MontaSelect
   sFiltroMS := dtmMS.MS_Lancamento.Filtro.Text;

   dtmMS.MS_Lancamento.Filtro.Add('CODDOCUMENTO IS NOT NULL');
   dtmMS.MS_Lancamento.Filtro.Add('RTRIM(STATUS_DOC) <> ''2''');

   // Pendência 22797 - Marcos Topini em 24/10/2006
   dtmMS.MS_Lancamento.Filtro.Add('IDMODULO = ' + IntToStr(Sistema.Idmodulo));
   // Fim Pendência 22797

   // Marcio Motta - 19/04/2004 - Pendência: 16195
   CtrlDocumento    := TCtrlDocumento.Create;
   CtrlParamIntegra := TCtrlParamIntegra.Create;

   CtrlDocumento.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                            ComunsImobiliario.MensErroMT);

   CtrlParamIntegra.InitializeAs(CtrlDocumento);

   // Fim implementação - Marcio Motta ----------------------------
end;



procedure TfrmExecLancAlteradorNovo.AbreQueries;
begin
   with dtmLookImobiliario.qryLookAlteradorXTipoImo do begin

      LimpaParametros(dtmLookImobiliario.qryLookAlteradorXTipoImo);

      ParamByName('PCODTIPIMOVEL').AsString     := sTipoImovel;
      ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.idEmpresa;
      ParamByName('PRECPAG').AsString           := sRecPag;

      if length(sRecPag) > 0 then begin
         case sRecPag[1] of
            'P':
            case rdgAcreDesc.ItemIndex of
               0: ParamByName('PACRESDECRES').AsString   := 'C'; // Acréscimo
               1: ParamByName('PACRESDECRES').AsString   := 'D'; // Desconto
            end;
            'R':
            case rdgAcreDesc.ItemIndex of
               0: ParamByName('PACRESDECRES').AsString   := 'D'; // Acréscimo
               1: ParamByName('PACRESDECRES').AsString   := 'C'; // Desconto
            end;
         end;
      end;

      Open;
   end;
end;



procedure TfrmExecLancAlteradorNovo.FechaQueries;
var
   i : integer;
begin
   for i := 0 to (ComponentCount - 1) do begin
      if ( (TObject(Components[i]).ClassType = TwwQuery) and (TwwQuery(Components[i]).Active) ) then begin
         TwwQuery(Components[i]).Close;
      end;
   end;

   dtmLancImovel.qryLancImovel.Close;
end;



procedure TfrmExecLancAlteradorNovo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmMS.MS_Lancamento.Filtro.Text := sFiltroMS;
   FechaQueries;

   inherited;
end;



procedure TfrmExecLancAlteradorNovo.btnExcluiAlteradorClick(Sender: TObject);
var
   iNumeroLancto        : integer;
//   iPlanilhaAEstornar   : integer;

begin
   inherited;
   if ( (qryAlteradoresLanc.Active) and (not(qryAlteradoresLanc.isEmpty)) ) then begin
     if MsgDlg('Deseja realmente EXCLUIR esse alterador?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
       Repaint;
       StartTransacao;
       try
         Screen.Cursor := crHourGlass;

         iNumeroLancto        := qryAlteradoresLancNUMLANCTO.asInteger;
         iDocumento           := qryAlteradoresLancCODDOCUMENTO.asInteger;
//         iPlanilhaAEstornar   := qryAlteradoresLancPLNCODIGO.asInteger;

         // Marcio Motta - 20/04/2004 - Pendência: 16195
         // Some com o LancToDocum e desfaz a contabilização se houver
         CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
         CtrlDocumento.CodDocumento          := iDocumento;
         CtrlDocumento.Lanctodocum.NumLancto := iNumeroLancto;

         if not CtrlDocumento.Delete then
            raise exception.create(CtrlDocumento.MessageInfo);
         // Fim Implementação - Marcio Motta


(*         // Some com o LanctoDocum
         Documento.Excluir(dtmImobiliario.qryAux, iDocumento, iNumeroLancto);

         // Desfaz a contabilização
         ExcluiLanc(True, iPlanilhaAEstornar, 'BASEDADOS', '64', IntegraBack.Plano, Sistema.idEmpresa,
                    Sistema.idUsuario, True, 0, IntegraBack.MascaraPlano);
*)

         CommitTransacao;
         qryAlteradoresLanc.Close;
         qryAlteradoresLanc.Open;

         MsgDlg('Alterador excluído.', 'Informação', mtInformation, [mbOk], 0);
         Repaint;

         Screen.Cursor := crDefault;
       except
         RollBackTransacao;
         Repaint;
         Screen.Cursor := crDefault;
       end;
     end;
   end;
end;



procedure TfrmExecLancAlteradorNovo.DBgrdAlteradoresLancCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecLancAlteradorNovo.bbtnConfirmarClick(Sender: TObject);
var iPlanilha : integer;

begin
   if VerificaPreenchimento then begin
     if MsgDlg('Deseja realmente lançar os valores no Contas a Pagar/Receber?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
       Repaint;
       try
         if ( (dtmLancImovel.qryLancImovel.Active) and not(dtmLancImovel.qryLancImovel.isEmpty) ) then begin

           iPlanilha   := 0;

           StartTransacao;
//---------- INÍCIO - Marcio Motta - 20/04/2004 - Pendência: 16195 ---------------------------------
           // Prepara a função para lançar o alterador
           CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
//           CtrlDocumento.OpenTransaction := True;
           CtrlDocumento.OpenTransaction := False;
           CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
           CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
           CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
           CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
           CtrlDocumento.IdModulo        := Sistema.idModulo;

           CtrlDocumento.Lanctodocum.SetValues( edtDataLancamento.Date,
                                                iDocumento, 0,
                                                StrToFloat(edtValor.Text),
                                                0,
                                                StrToFloat(edtValor.Text),
//                                                ModuloImobiliario.AdminImob.iUnidNegoc,
                                                // Marchetti - Pendencia 22952
                                                0,
                                                // Fim Marchetti - Pendencia 22952
                                                iPlanilha,
                                                0,
                                                Sistema.idUsuario,
                                                Sistema.idEmpresa,
                                                0, 0, 0, 0,
                                                dtmLookImobiliario.qryLookAlteradorXTipoImoCODALTERADOR.AsInteger,
                                                '4', '', '', '', edtObs.Text, '', '', '',
                                                dtmLookImobiliario.qryLookAlteradorXTipoImoACRESDECRES.AsString,
                                                Sistema.idModulo,
                                                ParamIntegra.Plano,
                                                Sistema.UsaPlanoPatro,
                                                not(chkContabiliza.Checked));

           if not CtrlDocumento.Insert then
              raise exception.Create( CtrlDocumento.MessageInfo );
//------- Fim Implementação/Alteração - Marcio Motta -----------------------------------------------

         end;
         CommitTransacao;
         qryAlteradoresLanc.Close;
         qryAlteradoresLanc.Open;
       except
         RollBackTransacao;
         MsgDlg('Houve erro durante a tentativa de integração com o Contas a Pagar/Receber.', 'Erro', mtError, [mbOk], 0);
         Repaint;
       end;
     end;
     Repaint;
   end;
end;


procedure TfrmExecLancAlteradorNovo.DBcboAlteradorCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if length(trim(DBcboAlterador.Text)) > 0 then begin
      iAlterador  := StrToInt(DBcboAlterador.LookupValue);

      // Pend. 17787 - Vinicius
      edtObs.Text := dtmLookImobiliario.qryLookAlteradorXTipoImoDESCRICAO.AsString;
   end else begin
      iAlterador := -1;
   end;
end;



function TfrmExecLancAlteradorNovo.VerificaPreenchimento: boolean;
begin
	Result := False;

	try

      if trim(edtDataLancamento.Text)= '' then
         raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', edtDataLancamento);

      if Trim(DBcboAlterador.Text) = '' then
         raise EValidacao.CreateVal('É necessário indicar o Alterador !', DBcboAlterador);

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



procedure TfrmExecLancAlteradorNovo.DBgrdAlteradoresLancTopRowChanged(Sender: TObject);
begin
   inherited;
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecLancAlteradorNovo.DBgrdReajusteCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecLancAlteradorNovo.DBgrdReajusteTopRowChanged(Sender: TObject);
begin
   inherited;
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecLancAlteradorNovo.btnProcurarClick(Sender: TObject);
begin
   inherited;

   try
      dtmMS.MS_Lancamento.Executar;

      // redesenha o form na volta do MontaSelect
      Repaint;

      // se houve busca, abre a query principal com apenas o registro buscado
      if dtmMS.MS_Lancamento.RetornouValor then begin

         Screen.Cursor  := crHourGlass;

         iDocumento       := StrToInt(dtmMS.MS_Lancamento.ValoresChave[1]);
         sTipoImovel      := dtmMS.MS_Lancamento.ValoresChave[5];
         sRecPag          := dtmMS.MS_Lancamento.ValoresChave[7];

         with dtmLancImovel.qryLancImovel do begin
            LimpaParametros(dtmLancImovel.qryLancImovel);
            ParamByName('PIDPESSOA').AsInteger     := Sistema.idEmpresa;
            ParamByName('PCODDOCUMENTO').AsInteger := iDocumento;
            Open;

            if not(IsEmpty) then begin
               with qryAlteradoresLanc do begin
                  LimpaParametros(qryAlteradoresLanc);
                  ParamByName('PCODDOCUMENTO').AsFloat := iDocumento;
                  Open;
               end;
            end;

         end;

         AbreQueries;
      end;

   finally
      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmExecLancAlteradorNovo.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CtrlDocumento);
  
end;

end.
