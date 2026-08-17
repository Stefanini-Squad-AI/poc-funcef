{-------------------------------------------------------------------------------
 Data       : 22.09.2006
 Autor      : Antonio Marcos (amf)
 Pendência  : 22574
 Descrição  : Corrigiu o controle de devolução. A Query do grid não foi alterada.
             apenas o controle foi corrigido.
----------------------------------------------------------------------------------}

unit FMTDevolMerc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, wwdbedit,uCmTypes,
  wwdbdatetimepicker, CMDateTimePicker, TREdit, CMProcuraSubTipo,
  CMDBLookupCombo, DBCtrls, wwdblook,uCtrlDevolMerc, uCtrlAlmox,uCtrlClasFisc;

type
  TFrmMTDevolMerc = class(TFrmCadastroMestreDetMT)
    dblcFornCli: TCMProcuraForCli;
    dbenNumDoc: TDBRealEdit;
    Label1: TLabel;
    gbDatas: TGroupBox;
    lblData: TLabel;
    lblEmissao: TLabel;
    dbeDataLanc: TCMDateTimePicker;
    dbeDataEmi: TCMDateTimePicker;
    dbeCompl: TwwDBEdit;
    lblBarra: TLabel;
    lblValor: TLabel;
    dbeValorCorrente: TDBRealEdit;
    gbNotaDev: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbenNumDocDev: TDBRealEdit;
    mskNumNF: TMaskEdit;
    dbeComplDev: TwwDBEdit;
    dbeValorCorrenteDev: TDBRealEdit;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    dbedDataLancDev: TCMDateTimePicker;
    dbedDataEmiDev: TCMDateTimePicker;
    CdsItemDevol: TCMClientDataSet;
    Label3: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    dbedQtdeEnt: TDBRealEdit;
    dbedValUN: TDBRealEdit;
    GroupBox1: TGroupBox;
    pnlDestino: TPanel;
    lblDestEdit: TLabel;
    dblkpcmbAlmoxa: TwwDBLookupCombo;
    dbrgECA: TDBRadioGroup;
    dblkpcmbDesc: TwwDBEdit;
    dblkpcmbArtigo: TwwDBEdit;
    dblcUnidMedida: TwwDBEdit;
    dblcClasFisc: TCMDBLookupCombo;
    TabContab: TTabSheet;
    dsContab: TwwDataSource;
    dbgContab: TwwDBGrid;
    CdsContab: TCMClientDataSet;
    CdsDevol: TCMClientDataSet;
    dsDevol: TwwDataSource;
    CdsAlmox: TCMClientDataSet;
    cdsClasFisc: TCMClientDataSet;
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure mskNumNFExit(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    DevolMerc : TCtrlDevolMerc;
    Almox     : TCtrlAlmox;
    ClasFisc  : TCtrlClasFisc;
    FTotalDevolvidoArtigo: double;
    Procedure Sel( n : Double );
  public
    { Public declarations }
  end;

var
  FrmMTDevolMerc: TFrmMTDevolMerc;

implementation

{$R *.DFM}

Uses DBaseDados, uSistema, uMensErro, uModulo, uDataBase, uCtrlParamIntegra;

procedure TFrmMTDevolMerc.FormCreate(Sender: TObject);
begin
  inherited;
  DevolMerc := TCtrlDevolMerc.Create;
  DevolMerc.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  DevolMerc.CdsDevol     := CdsDevol;
  DevolMerc.CdsNota      := Cds;
  DevolMerc.CdsContab    := CdsContab;
  DevolMerc.CdsItemDevol := CdsItemDevol;

  Almox := TCtrlAlmox.Create;
  Almox.InitializeAs( DevolMerc );

  ClasFisc := TCtrlClasFisc.Create;
  ClasFisc.InitializeAs( DevolMerc );

  MontaSelect.Filtro.Add('NFRECEBDEVOL.IDPESSOA = '+IntToStr(Sistema.idempresa));
  MontaSelect.Filtro.Add('NFRECEBDEVOL.FLGTIPONOTA = ''R''');

  Sel(-1);

  CdsAlmox.Data     := Almox.ListAlmox( Sistema.IdEmpresa );
  cdsClasFisc.Data  := ClasFisc.ListCodigosFiscais;

  mskNumNF.EditMask :=  ParamIntegra.MascaraNoDocumPag +';1; ';

end;


procedure TFrmMTDevolMerc.CmeDetalheConfirma(Sender: TObject);
Var
   c : String[01];
Begin
 if (CdsItemDevol.State in ([dsInsert,dsEdit])) then
    Begin
       if (pgctrlDetalhe.ActivePage.PageIndex = 0) and (CdsItemDevol.State in ([dsInsert,dsEdit])) then
         Begin
             With CdsItemDevol Do
               Begin
                   FieldByName('VLRDEV').AsFloat := ( FieldByName('QTDEDEV').AsFloat * FieldByName('VLRESTOQUE').AsFloat ) / FieldByName('QTDERECEBDEVOL').AsFloat;
                   If Trim(dblcClasFisc.Text) = '' Then
                      Begin
                         C := Copy(FieldByName('CODFISCAL').AsString,1,1);
                         If C = '1' Then C := '5'
                         Else If C = '2' Then C := '6'
                         Else If C = '3' Then C := '7';
                         if Modulo.sIntegraLivro = 'S' then
                            FieldByName('CODFISCAL').AsString := C + Copy(FieldByName('CodFiscal').AsString,2,Length(FieldByName('CODFISCAL').AsString));
                      End
                   Else
                     Begin
                        FieldByName('CODFISCAL').AsString :=  dblcClasFisc.LookupValue;
                     End;
               End;
         End;
    End;
  inherited;
  bbtnVoltarDet.Click;
end;


procedure TFrmMTDevolMerc.Sel(n: Double);
begin
   Cds.Data          := DevolMerc.ListDevolucao( n );
   CdsItemDevol.Data := DevolMerc.ListItemDevol( n );

   CdsDevol.Data     := DevolMerc.ListDevolucao( 0 );
   CdsContab.Data    := DevolMerc.ListContabilizacao( 0 );

   CdsItemDevol.First;
   While Not CdsItemDevol.EOf Do
      Begin
          CdsItemDevol.Edit;
          If CdsItemDevol.FieldByName('IDPRODVARI').isNull Then
          begin
             FTotalDevolvidoArtigo := DevolMerc.TotalArtigoDevolvido(Cds.FieldByName('IDNFRECEBDEVOL').AsFloat,CdsItemDevol.FieldByName('CODARTIGO').AsString);
             CdsItemDevol.FieldByName('QTDEDEV').AsFloat := FTotalDevolvidoArtigo;
             CdsItemDevol.FieldByName('VLRDEV').AsFloat  := FTotalDevolvidoArtigo * CdsItemDevol.FieldByName('VLRUNITARIO').AsFloat;
          end;
          CdsItemDevol.Post;
          CdsItemDevol.Next;
      End;
end;

procedure TFrmMTDevolMerc.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
   dblkpcmbAlmoxa.LookUpValue := CdsItemDevol.FieldByName('CODALMOXARIFADO').AsString;
   cdsItemDevol.FieldByName('CODCUSTEIO').AsInteger := cdsAlmox.FieldByName('CODCUSTEIO').AsInteger;
   dbedQtdeEnt.SetFocus;
end;

procedure TFrmMTDevolMerc.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  gbNotaDev.Enabled := True;

  Cds.CancelUpdates;
  CdsContab.CancelUpdates;
  CdsDevol.CancelUpdates;
  CdsItemDevol.CancelUpdates;

  CdsItemDevol.First;
  While Not CdsItemDevol.EOf Do
     Begin
         CdsItemDevol.Edit;

         if CdsItemDevol.FieldByName('IDPRODVARI').isNull Then
             CdsItemDevol.FieldByName('QTDEDEV').AsFloat := DevolMerc.TotalArtigoDevolvido(Cds.FieldByName('IDNFRECEBDEVOL').AsFloat,CdsItemDevol.FieldByName('CODARTIGO').AsString);

          CdsItemDevol.FieldByName('VLRDEV').AsFloat  := FTotalDevolvidoArtigo * CdsItemDevol.FieldByName('VLRUNITARIO').AsFloat;//CdsItemDevol.FieldByName('QTDEDEV').AsFloat * CdsItemDevol.FieldByName('VLRUNITARIO').AsFloat;

         CdsItemDevol.Next;
     End;
  //

  CdsDevol.Insert;
  CdsDevol.FieldByName('DATAENTDEVOL').AsDateTime := Date;
  CdsDevol.FieldByName('DATAEMISNF').AsDateTime   := Date;

  dbedDataEmiDev.Date  := Date;
  dbedDataLancDev.Date := Date;

  mskNumNF.Visible   := (ParamIntegra.MascaraNoDocumPag <> '');
  mskNumNF.Text      := '';

  dbenNumDocDev.Visible := Not mskNumNF.Visible;

  If dbenNumDocDev.Visible Then
     dbenNumDocDev.SetFocus
  Else
     mskNumNF.SetFocus;

  If ParamIntegra.AssociaComplTipoFat Then
     Begin
         CdsDevol.FieldByName('COMPLNF').asString := ParamIntegra.BuscaCodigoFiscalReduzido(dblcFornCli.ForCliReg.Id);
         dbeComplDev.Text                         := ParamIntegra.BuscaCodigoFiscalReduzido(dblcFornCli.ForCliReg.Id);
         dbeComplDev.Enabled                      := False;
         If Trim(dbeCompl.Text) =  '' Then
           Begin
               MsgDlg('Fornecedor não possui Classificação Fiscal','Erro',MtError,[mbOK],0);
               bbtnCancelar.Click;
           End;
    End;
end;

procedure TFrmMTDevolMerc.mskNumNFExit(Sender: TObject);
Var
   s : String;
begin
  inherited;
  s := mskNumNF.Text;
  While Pos('.',s) <> 0 Do
    Delete(s,Pos('.',s),1);
  //
  If Trim(mskNumNF.Text) <> '' then
     Begin
        CdsDevol.FieldByName('NUMNF').AsFloat := StrToFloat( s );
        dbenNumDocDev.Value                   := StrToFloat( s );
     End;
  dbeValorCorrenteDev.SetFocus;
end;

procedure TFrmMTDevolMerc.bbtnCancelarClick(Sender: TObject);
begin
  Cds.CancelUpdates;
  CdsContab.CancelUpdates;
  CdsDevol.CancelUpdates;
  CdsItemDevol.CancelUpdates;
  inherited;
end;

procedure TFrmMTDevolMerc.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

   if CdsItemDevol.FieldByName('IDPRODVARI').isNull Then
       FTotalDevolvidoArtigo := DevolMerc.TotalArtigoDevolvido(Cds.FieldByName('IDNFRECEBDEVOL').AsFloat,CdsItemDevol.FieldByName('CODARTIGO').AsString);

   if (cdsItemDevol.FieldByName('QTDEDEV').AsFloat + FTotalDevolvidoArtigo) >
      (cdsItemDevol.FieldByName('QTDERECEBDEVOL').AsFloat) then
   begin
      Application.MessageBox('Quantidade devolvida excede a quantidade recebida ', 'Erro de Devolução', mb_OK + mb_IconError);
      Accept := False;
      abort;
   end;

  If CdsDevol.ChangeCount > 0 Then
     CdsDevol.Post;

  Accept := DevolMerc.Devolver( Sistema.IdEmpresa,
                                Sistema.UsaPlanoPatro,
                                Modulo.sIntegraContab = 'S',
                                Modulo.sIntegraLivro = 'S',
                                Modulo.iCodAlteradorDevol,
                                Sistema.IdUsuario,
                                Modulo.iIdPatro,
                                Modulo.iIdPlanoPrev,
                                Modulo.iIdPrograma,
                                Modulo.iUnidadeNegocPadrao,
                                Modulo.sCodCCusto);
end;

procedure TFrmMTDevolMerc.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(DevolMerc.MessageInfo,'Erro',MtError,[mbOK],0);
end;

procedure TFrmMTDevolMerc.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     Sel( StrToFloat(MontaSelect.ValoresChave[0]) );

end;

procedure TFrmMTDevolMerc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DevolMerc.Free;
  Almox.Free;
  ClasFisc.Free;

end;

end.
