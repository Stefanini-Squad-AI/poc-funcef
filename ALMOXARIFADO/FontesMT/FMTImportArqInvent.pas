unit FMTImportArqInvent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc,
  DBClient, uCMClientDataSet, uCtrlInventario, MontaSelect;

type
  TFrmMTImportArqInvent = class(TfrmSairAjuda)
    Panel2: TPanel;
    lbInvent: TLabel;
    lbAlmox: TLabel;
    btnProcurar: TBitBtn;
    cdsInvent: TCMClientDataSet;
    dsInvent: TwwDataSource;
    grdinvent: TwwDBGrid;
    MontaSelect: TMontaSelect;
    btnImportar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    Dlg: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
  private
    { Private declarations }
    Inventario : TCtrlInventario;
    //
    Procedure Sel ( n : Integer );

  public
    { Public declarations }
  end;

var
  FrmMTImportArqInvent: TFrmMTImportArqInvent;

implementation

{$R *.DFM}

Uses uModulo, uSistema, DBaseDados, uMensErro;

procedure TFrmMTImportArqInvent.FormCreate(Sender: TObject);
begin
  inherited;
  lbAlmox.Caption := 'Almoxarifado : '+ Modulo.sAlmoxaUsuario;

  Inventario := TCtrlInventario.Create;
  Inventario.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  MontaSelect.Filtro.Add('INVENTAR.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
  MontaSelect.Filtro.Add('INVENTAR.CODALMOXARIFADO = '+IntToStr(Modulo.iCodAlmoxa));
  MontaSelect.Filtro.Add('INVENTAR.CONTAGEMENCERRADA <> ''T''');

  Sel(-1);

end;

procedure TFrmMTImportArqInvent.Sel(n: Integer);
begin
   cdsInvent.Data := Inventario.ListContagem(n,Modulo.iCodCusteio,Modulo.iCodAlmoxa) ;
   TFloatField(cdsInvent.FieldByName('CUSTOMEDIO')).DisplayFormat  :='#,##0.00';
   TFloatField(cdsInvent.FieldByName('QTDECONTADA')).DisplayFormat :='#,####0.0000';

   If n > 0 Then
      lbInvent.Caption := 'Nº Inventário : '+ IntToStr( n )
   Else
      lbInvent.Caption := 'Nº Inventário ';
      
   btnImportar.Enabled :=  cdsInvent.IsEmpty;

end;

procedure TFrmMTImportArqInvent.btnImportarClick(Sender: TObject);
Var
   sArq : TStrings;
begin
  inherited;
  If Dlg.Execute Then
     Begin
        sArq  := TStringList.Create;
        Try
           sArq.LoadFromFile( Dlg.FileName );

           If Not Inventario.ImportArqInvent(StrToIntDef(MontaSelect.ValoresChave[0],0),sArq) Then
              MsgDlg(Inventario.MessageInfo,'Erro',MtError,[mbOk],0);
              
        Finally
           sArq.Free;
        End;
     End;

end;

procedure TFrmMTImportArqInvent.btnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  If MontaSelect.RetornouValor Then
     Sel( StrToIntDef(MontaSelect.ValoresChave[0],0) );

end;

end.
