unit FMTAtendPrePronta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask,
  DBCtrls, TREdit, Wwkeycb, Grids, Wwdbigrd, Wwdbgrid, wwdblook, DBTables,
  Db, Wwdatsrc, Wwquery, MontaSelect, IvDictio, IvMulti, 
  ComCtrls, wwdbdatetimepicker, CMDateTimePicker, IvEMulti, DBClient,
  uCMClientDataSet, uCtrlSCPrePronta, uCtrlCentRespon, uCtrlUnidNegocio,
  uCtrlAlmoxCompra;

type


  TFrmMTAtendPrePronta = class(TfrmOkCancelar)
    dsGrid: TwwDataSource;
    grpArtigo: TGroupBox;
    edReq: TEdit;
    Label2: TLabel;
    MontaSelect: TMontaSelect;
    btnProcurar: TBitBtn;
    Label3: TLabel;
    lblCResp: TLabel;
    dblcCentRespon: TwwDBLookupCombo;
    lblAtiv: TLabel;
    dblcAtividade: TwwDBLookupCombo;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edUnid: TDBEdit;
    Label8: TLabel;
    edCodArt: TDBEdit;
    Label9: TLabel;
    edNPessoa: TDBRealEdit;
    edQtdeSug: TDBRealEdit;
    edQtdeSoli: TDBRealEdit;
    BtnSCI: TBitBtn;
    chkRepete: TCheckBox;
    ToolbarSep972: TToolbarSep97;
    lblAlmox: TLabel;
    edAlmoxa: TEdit;
    edDataEmis: TCMDateTimePicker;
    edDataNec: TCMDateTimePicker;
    Label1: TLabel;
    Label10: TLabel;
    pgc: TPageControl;
    tabDados: TTabSheet;
    TabOBS: TTabSheet;
    dbgrd: TwwDBGrid;
    memSCI: TMemo;
    Cds: TCMClientDataSet;
    CdsDet: TCMClientDataSet;
    CdsCentRespon: TCMClientDataSet;
    CdsUnidNegoc: TCMClientDataSet;
    pnlAmbos: TPanel;
    RgDestino: TRadioGroup;
    pnlUm: TPanel;
    GroupBox1: TGroupBox;
    lblDestino: TLabel;
    cdsParamCompras: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure edNPessoaExit(Sender: TObject);
    procedure dbgrdExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure edQtdeSoliExit(Sender: TObject);
    procedure RgDestinoClick(Sender: TObject);
    procedure BtnSCIClick(Sender: TObject);
    procedure edNPessoaEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

    AlmoxCompra : TCtrlAlmoxCompra;
    iOpDestino  : integer;

    { Private declarations }
    SCPrePronta  : TCtrlSCPrePronta;
    CentroRespon : TCtrlCentRespon;
    UnidNegocio  : TCtrlUnidNegocio;
    //
    Procedure SelMestreDet( n : LongInt );

    procedure MudaDestino;

  public
    { Public declarations }
  end;

var
  FrmMTAtendPrePronta : TFrmMTAtendPrePronta;
  iUltPessoa        : Integer;
implementation

{$R *.DFM}

Uses uSistema, uModulo, uMensErro, uDataBase, DBaseDados;

Procedure TFrmMTAtendPrePronta.SelMestreDet( n : LongInt );
Begin
    Cds.Data := SCPrePronta.Procurar( n );
    CdsDet.Data := SCPrePronta.ListItemAtendSCI(n, Modulo.iCodAlmoxa );
    //
    edDataEmis.Date := Date;
    edDataNec.Date  := Date;
    memSCI.Lines.Clear;
End;

procedure TFrmMTAtendPrePronta.FormCreate(Sender: TObject);
var
  sAux : string;
begin
  inherited;
  SCPrePronta := TCtrlSCPrePronta.Create;
  SCPrePronta.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  SCPrePronta.cds     := Cds;
  SCPrePronta.cdsItem := CdsDet;

  CentroRespon := TCtrlCentRespon.Create;
  CentroRespon.InitializeAs(SCPrePronta);

  UnidNegocio  := TCtrlUnidNegocio.Create;
  UnidNegocio.InitializeAs(SCPrePronta);
  //

  //--------------------------------------------------------------------------//
  AlmoxCompra := TCtrlAlmoxCompra.Create;
  AlmoxCompra.InitializeAs(SCPrePronta);

  cdsParamCompras.Data := AlmoxCompra.GetParamCompras( Sistema.IdEmpresa );
  sAux := cdsParamCompras.FieldByName('OPDESTINO').AsString;

  if sAux = 'A' then
  begin
    pnlAmbos.Visible := True;
    pnlAmbos.BringToFront;
  end
  else
  begin
    pnlUm.Visible := True;
    pnlUm.BringToFront;
    if sAux = 'E' then
    begin
      lblDestino.Caption := 'Estoque';
      iOpDestino := 0;
    end
    else
    begin
      lblDestino.Caption := 'Custo';
      iOpDestino := 1;
    end;
    MudaDestino;
  end;
  //--------------------------------------------------------------------------//

  //
  iUltPessoa := 0;
  edAlmoxa.Text := Modulo.sAlmoxaUsuario;
  //
  SelMestreDet( -1 );
  //
  MontaSelect.Filtro.Add(' IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
  MontaSelect.Filtro.Add(' CODALMOXARIFADO = '+IntToStr(Modulo.iCodAlmoxa));
  //
  CdsCentRespon.Data := CentroRespon.ListaCentRespon(Sistema.IdEmpresa);
  CdsUnidNegoc.Data  := UnidNegocio.ListaUnidNegocio(Sistema.IdEmpresa);
  //
  chkRepete.Checked := False;
end;

procedure TFrmMTAtendPrePronta.btnProcurarClick(Sender: TObject);
begin
  inherited;
    MontaSelect.Executar;
    If MontaSelect.RetornouValor Then
       Begin
           SelMestreDet( StrToInt(MontaSelect.ValoresChave[0]) );
           edReq.Text := Cds.FieldByName('DESCSCPREPRONTA').asString;
           pgc.ActivePage := TabDados;
           dbgrd.SetFocus;
       End;
end;

procedure TFrmMTAtendPrePronta.edNPessoaExit(Sender: TObject);
begin
  inherited;
   CdsDet.FieldByName('QTDESUG').asFloat  := CdsDet.FieldByName('QTDEPESSOA').asFloat * edNPessoa.Value;
   CdsDet.FieldByName('QTDESOLI').asFloat := CdsDet.FieldByName('QTDEPESSOA').asFloat * edNPessoa.Value;
   iUltPessoa := CdsDet.FieldByName('NPESSOAS').asInteger;
End;


procedure TFrmMTAtendPrePronta.dbgrdExit(Sender: TObject);
begin
  inherited;
  If CdsDet.Active Then
    Begin
      If CdsDet.EOF Then
          BtnSCI.SetFocus
      Else
         edNPessoa.SetFocus;
   End;
end;

procedure TFrmMTAtendPrePronta.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if CdsDet.State in [dsEdit] Then
    Begin
      CdsDet.Post;
      If Not CdsDet.Eof Then
           CdsDet.Next;
      pgc.ActivePage := TabDados;
      dbgrd.SetFocus;
    End;
end;


procedure TFrmMTAtendPrePronta.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  CdsDet.Cancel;
end;

procedure TFrmMTAtendPrePronta.edQtdeSoliExit(Sender: TObject);
begin
  inherited;
   If chkRepete.Checked Then
     Begin
         While Not CdsDet.EOF Do
            Begin
                CdsDet.Edit;
                CdsDet.FieldByName('QTDESUG').asFloat  := CdsDet.FieldByName('QTDEPESSOA').asFloat * iUltPessoa;
                CdsDet.FieldByName('QTDESOLI').asFloat := CdsDet.FieldByName('QTDEPESSOA').asFloat * iUltPessoa;
                CdsDet.FieldByName('NPESSOAS').asFloat := iUltPessoa;
                CdsDet.Next;
            End;
     End
   Else
     CdsDet.Edit;
end;

procedure TFrmMTAtendPrePronta.RgDestinoClick(Sender: TObject);
begin
  inherited;
  iOpDestino := rgDestino.ItemIndex;
  MudaDestino;
end;

procedure TFrmMTAtendPrePronta.BtnSCIClick(Sender: TObject);
begin
  inherited;
  If trim(dblcCentRespon.text) = '' Then
     Begin
        MsgDlg('Centro de Responsabilidade não foi preenchida','Erro',mtError,[mbOK],0);
        dblcCentRespon.SetFocus;
        Exit;
     End;
  If trim(edDataEmis.text) = '' Then
     Begin
        MsgDlg('Data de emissão não foi preenchida','Erro',mtError,[mbOK],0);
        edDataEmis.SetFocus;
        Exit;
     End;
  If trim(edDataNec.text) = '' Then
     Begin
        MsgDlg('Data de necessidade não foi preenchida','Erro',mtError,[mbOK],0);
        edDataNec.SetFocus;
        Exit;
     End;
  If edDataNec.Date < edDataEmis.Date Then
     Begin
        MsgDlg('Data de necessidade não pode ser menor que data de emissão','Erro',mtError,[mbOK],0);
        edDataNec.SetFocus;
        Exit;
     End;
  If trim(dblcCentRespon.text) = '' Then
     Begin
        MsgDlg('Centro de Responsabilidade não foi preenchida','Erro',mtError,[mbOK],0);
        dblcCentRespon.SetFocus;
        Exit;
     End;
  If Not SCPrePronta.GerarSCI(Sistema.IdEmpresa,
                              Sistema.IdUsuario,
                              Modulo.iCodAlmoxa,


                              TTipoDestino( iOpDestino ),

                              StrToIntDef(dblcAtividade.LookupValue ,-1),
                              dblcCentRespon.LookupValue,
                              edDataNec.Date,
                              edDataEmis.Date,
                              Modulo.sCodCCusto)
  Then
      MsgDlg(SCPrePronta.MessageInfo,'Erro',mtError,[mbOk],0)
  Else
      MsgDlg(SCPrePronta.MessageInfo,'Informação',mtInformation,[mbOk],0);

   SelMestreDet( -1 );
   edReq.Text := '';
end;

procedure TFrmMTAtendPrePronta.edNPessoaEnter(Sender: TObject);
begin
  inherited;
  CdsDet.Edit;
  CdsDet.FieldByName('NPessoas').asInteger := iUltPessoa;
  edNPessoa.Value := iUltPessoa;
  edNPessoa.Text  := intToStr(iUltPessoa);
  edNPessoa.SelectAll;
end;

procedure TFrmMTAtendPrePronta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  SCPrePronta.Free;
  CentroRespon.Free;
  UnidNegocio.Free;

  AlmoxCompra.Free;

end;

procedure TFrmMTAtendPrePronta.MudaDestino;
begin
  If iOpDestino = 1 Then
     Begin
         lblAlmox.Caption := 'Centro de Custo';
         edAlmoxa.Text := Modulo.sDescCCusto;
     End
  Else
     Begin
         lblAlmox.Caption := 'Almoxarifado';
         edAlmoxa.Text    := Modulo.sAlmoxaUsuario;
     End
end;

end.
