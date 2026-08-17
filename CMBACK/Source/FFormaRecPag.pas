unit FFormaRecPag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCs, Db, DBTables, CMwwQuery, StdCtrls, Mask, DBCtrls, cmseldlg,
  wwidlg, Wwdatsrc, MAHlpBtn, Buttons,  ComCtrls, ToolWin, Grids,
  Wwdbigrd, Wwdbgrid,UMenserro , ExtCtrls, TB97, TB97Ctls, TB97Tlbr,
  FCadastroGrid, MontaSelect, IvDictio, IvMulti, IvEMulti,
  CmEventosCadastro, ImgList;

type
  TfrmFormaRecPag = class(TfrmCadastroGridCS)
    lblFormaRecPag: TLabel;
    dbedFormaRecPag: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    qryCODFORMA: TFloatField;
    qryRECPAG: TStringField;
    qryDESCRICAO: TStringField;
    qryIDPESSOA: TFloatField;
    qryFLGDADOSBANCARIOS: TStringField;
    qryIDUSUARIOINCLUSAO: TFloatField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFormaRecPag: TfrmFormaRecPag;

implementation

uses USistema,UAutorizacao, Udatabase, uIntegraBack;

{$R *.DFM}

procedure TfrmFormaRecPag.bbtnConfirmarClick(Sender: TObject);
Var sForma: String;
begin
if dbedFormaRecPag.Text  = ''  then
  begin
    If IntegraBack.RecPag = 'P' Then
       sForma := 'Pagamento'
    Else
       sForma := 'Recebimento';

    MsgDlg('Favor indicar a Formade de ' + sForma,'Aviso',mtError,[mbOk],0);
    dbedFormaRecPag.SetFocus;
    exit;
  end;

  inherited;
end;

procedure TfrmFormaRecPag.FormCreate(Sender: TObject);
begin
  If IntegraBack.RecPag = 'R' Then
     Caption:='Tipo de Cobrança'
  Else
     Caption:='Forma de Pagamento';

  qry.SQL.Text := 'SELECT    CODFORMA,  RECPAG,  DESCRICAO,  IDPESSOA,  FLGDADOSBANCARIOS, IDUSUARIOINCLUSAO FROM FORMARECPAG ' +
                  ' WHERE (IDPESSOA = ' + IntToStr(Sistema.idEmpresa) +
                  ' AND RECPAG = '''  +  IntegraBack.RecPag + ''')' +
                  ' ORDER BY DESCRICAO';
  qry.Open;
  inherited;
  MontaSelect.Filtro.Add('FORMARECPAG.RECPAG = ''' +  IntegraBack.RecPag + '''');
  MontaSelect.Filtro.Add('FORMARECPAG.IDPESSOA = ' + IntToStr(Sistema.idEmpresa)) ;
end;

Procedure TfrmFormaRecPag.CmeCadastroInsert(Sender: TObject);
Begin
  inherited;
  qryCODFORMA.AsInteger          := leultregistro(nil,'FORMARECPAG');
  qryIDUSUARIOINCLUSAO.AsInteger := Sistema.idUsuario;
  qryIDPESSOA.AsInteger          := Sistema.idEmpresa;
  qryRECPAG.AsString             := IntegraBack.RecPag ;
  qryFLGDADOSBANCARIOS.AsString  := 'N';
  dbedFormaRecPag.setfocus;
End;

Procedure TfrmFormaRecPag.CmeCadastroEdit(Sender: TObject);
Begin
  inherited;
  dbedFormaRecPag.setfocus;
End;

procedure TfrmFormaRecPag.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If (MontaSelect.ValoresChave.Count <> 0) AND (Trim(MontaSelect.ValoresChave[0]) <> '') Then
     Qry.Locate('CODFORMA;RECPAG;IDPESSOA',VarArrayOf([MontaSelect.ValoresChave[0],MontaSelect.ValoresChave[1],MontaSelect.ValoresChave[2]]),[]);
End;

end.
