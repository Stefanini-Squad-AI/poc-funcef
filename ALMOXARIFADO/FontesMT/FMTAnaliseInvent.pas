unit FMTAnaliseInvent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, MontaSelect,
  uCtrlInventario, Db, DBClient, uCMClientDataSet, Wwdatsrc, uCmSqlParams,
  wwdblook,uCtrlUnidNegocio;
type
  TFrmMTAnaliseInvent = class(TfrmSairAjuda)
    Panel2: TPanel;
    lbInvent: TLabel;
    lbAlmox: TLabel;
    btnProcurar: TBitBtn;
    MontaSelect: TMontaSelect;
    bbtnAtualizaSaldo: TBitBtn;
    dsAnalise: TwwDataSource;
    cdsAnalise: TCMClientDataSet;
    grdDiferencas: TwwDBGrid;
    Label3: TLabel;
    dblcAtiv: TwwDBLookupCombo;
    cdsUnidNegoc: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure grdDiferencasCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure bbtnAtualizaSaldoClick(Sender: TObject);
  private
    { Private declarations }
    Inventario  : TCtrlInventario;
    UnidNegocio : TCtrlUnidNegocio;
    //
    procedure Sel( n : Integer );
  public
    { Public declarations }
  end;

var
  FrmMTAnaliseInvent: TFrmMTAnaliseInvent;

implementation

{$R *.DFM}

uses uSistema, uModulo, DBaseDados, uMensErro;

procedure TFrmMTAnaliseInvent.FormCreate(Sender: TObject);
begin
  inherited;
  lbAlmox.Caption := 'Almoxarifado : '+ Modulo.sAlmoxaUsuario;

  Inventario := TCtrlInventario.Create;
  Inventario.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  UnidNegocio := TCtrlUnidNegocio.Create;
  UnidNegocio.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  MontaSelect.Filtro.Add('INVENTAR.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
  MontaSelect.Filtro.Add('INVENTAR.CODALMOXARIFADO = '+IntToStr(Modulo.iCodAlmoxa));
  MontaSelect.Filtro.Add('INVENTAR.CONTAGEMENCERRADA <> ''T''');

  Sel(-1);
  
  cdsUnidNegoc.Data := UnidNegocio.ListaUnidNegocio( Sistema.IdEmpresa );
end;

procedure TFrmMTAnaliseInvent.Sel( n : Integer );
begin
   cdsAnalise.Data := Inventario.ListDiferencas(n,Modulo.iCodCusteio,Modulo.iCodAlmoxa) ;

   TFloatField(cdsAnalise.FieldByName('CUSTOMEDIO')).DisplayFormat  :='#,##0.00';
   TFloatField(cdsAnalise.FieldByName('QTDECONTADA')).DisplayFormat :='#,####0.0000';
   TFloatField(cdsAnalise.FieldByName('DIFERENCAATUAL')).DisplayFormat :='#,####0.0000';
   TFloatField(cdsAnalise.FieldByName('SALDOINICIAL')).DisplayFormat :='#,####0.0000';

   If n > 0 Then
      lbInvent.Caption := 'Nº Inventário : '+ IntToStr( n )
   Else
      lbInvent.Caption := 'Nº Inventário ';

End;


procedure TFrmMTAnaliseInvent.btnProcurarClick(Sender: TObject);
begin
  inherited;
   MontaSelect.Executar;
  If MontaSelect.RetornouValor Then
     Begin
       If Inventario.GeraDiferencas( StrToIntDef(MontaSelect.ValoresChave[0],0) ) Then
          Sel( StrToIntDef(MontaSelect.ValoresChave[0],0) )
       Else
          MsgDlg(Inventario.MessageInfo, 'Atenção', mtError, [mbOk], 0);
     End;


end;

procedure TFrmMTAnaliseInvent.grdDiferencasCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  IF (Field.FieldName ='DIFERENCAATUAL') And (Field.Value > 0) Then
      AFont.Color := clNavy
  Else
  IF (Field.FieldName ='DIFERENCAATUAL') And (Field.Value < 0) Then
      AFont.Color := clRed;

end;

procedure TFrmMTAnaliseInvent.bbtnAtualizaSaldoClick(Sender: TObject);
begin
  inherited;
  If (trim(dblcAtiv.Text) = '') Then
     Begin
        MsgDlg('Atividade/Projeto não foi preenchido','Erro',mtError,[mbOk],0);
        dblcAtiv.SetFocus;
     End
  Else
     Begin
          bbtnAtualizaSaldo.Enabled:=False;
          If cdsAnalise.IsEmpty Then
             MsgDlg('Este procedimento irá apenas fechar o inventário sem atualizar o saldo, pois não foram encontradas diferenças na contagem.','Aviso',mtWarning,[mbOk],0)
          Else
             MsgDlg('Este procedimento atualizará o saldo do almoxarifado pela contagem física','Aviso',mtWarning,[mbOk],0);
          If (MsgDlg('Confirma a execução','Aviso',mtConfirmation,[mbOk,mbCancel],0)) = mrOK Then
            Begin
               If Inventario.AtualizaSaldo(StrToIntDef(MontaSelect.ValoresChave[0],0),StrToInt(dblcAtiv.LookupValue) ) Then
                  MsgDlg('Atualização de Saldo efetuada com Sucesso','Aviso',mtInformation,[mbOk],0)
               Else
                  MsgDlg(Inventario.MessageInfo,'Erro',mtError,[mbOk],0);
            End;
     End;
end;

end.
