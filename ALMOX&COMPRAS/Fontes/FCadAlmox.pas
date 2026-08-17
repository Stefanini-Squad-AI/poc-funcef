unit FCadAlmox;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, wwdblook, Mask, DBCtrls, CmEventosCadastro, ImgList;

type
  TFrmCadAlmox = class(TfrmCadastroCS)
    qryUnCusteio: TwwQuery;
    qryCentroCusto: TwwQuery;
    dblkcmbUnCusteio: TwwDBLookupCombo;
    Label1: TLabel;
    Label3: TLabel;
    dblkcmbCentroCusto: TwwDBLookupCombo;
    edAlmoxa: TLabel;
    dbedDesc: TDBEdit;
    rgrpTipoAlmox: TDBRadioGroup;
    qryCODALMOXARIFADO: TFloatField;
    qryCODCUSTEIO: TFloatField;
    qryIDPESSOA: TFloatField;
    qryCODCENTROCUSTO: TStringField;
    qryIDEMPRESA: TFloatField;
    qryDESCALMOX: TStringField;
    qryPRINCIPSECUND: TStringField;
    qryUnCusteioCODCUSTEIO: TFloatField;
    qryUnCusteioDESCCUSTEIO: TStringField;
    qryUnCusteioUCCONTABIL: TStringField;
    qryCONTABIL: TStringField;
    procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    Procedure Sel( n : LongInt );
  public
    { Public declarations }
  end;

var
  FrmCadAlmox: TFrmCadAlmox;

implementation

Uses uMensErro, uSistema, uDataBase;   
{$R *.DFM}

procedure TFrmCadAlmox.FormCreate(Sender: TObject);
begin
  inherited;
  qryCentroCusto.Close;
  qryCentroCusto.Params[0].Value := Sistema.IdEmpresa;
  qryCentroCusto.Open;
  //
  qryUnCusteio.Close;
  qryUnCusteio.Params[0].Value := Sistema.IdEmpresa;
  qryUnCusteio.Open;
  //
  Sel( -1 );
  //
  MontaSelect.Filtro.Add('ALMOX.IDPESSOA = '+IntToStr( Sistema.IdEmpresa ));
end;

Procedure TFrmCadAlmox.Sel( n : LongInt );
Begin
    qry.Close;
    qry.Params[0].Value := n;
    qry.Open;
End;

Procedure TFrmCadAlmox.CmeCadastroInsert(Sender: TObject);
Begin
    inherited;
    dbedDesc.SetFocus;
    qry.FieldByName('PRINCIPSECUND').asString :=  'P';
End;

Procedure TFrmCadAlmox.CmeCadastroEdit(Sender: TObject);
Begin
    inherited;
    dbedDesc.SetFocus;
End;

Procedure TFrmCadAlmox.CmeCadastroFind(Sender: TObject);
Begin
    inherited;
    If MontaSelect.RetornouValor Then
       Begin
           Sel( StrToInt( MontaSelect.ValoresChave[0] ) );
       End;
End;

Procedure TFrmCadAlmox.CmeCadastroConfirma(Sender: TObject);
Begin
    If qry.State in [dsInsert, dsEdit] Then
       Begin
           If qry.State = dsInsert Then
               qry.FieldByName('CODALMOXARIFADO').asInteger := LeUltRegistro(nil,'ALMOX');
           qry.FieldByName('CONTABIL').AsString    := qryUnCusteio.FieldByName('UCCONTABIL').AsString;
           qry.FieldByName('IDPESSOA').AsInteger   := Sistema.IdEmpresa;
           qry.FieldByName('IDEMPRESA').AsInteger  := Sistema.IdEmpresa;
       End;
    inherited;

End;

end.
