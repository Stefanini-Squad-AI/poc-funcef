unit FParamLivroInvet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, FOkCancelar, wwdblook, Db, DBTables, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker, Spin;

type
  TFrmParamLivroInvet = class(TfrmOkCancelar)
    qryGrpProd: TwwQuery;
    qryAlmox: TwwQuery;
    Label3: TLabel;
    dblcAlmox: TwwDBLookupCombo;
    Label5: TLabel;
    dblcGrpProd: TwwDBLookupCombo;
    RgOrdem: TRadioGroup;
    Label1: TLabel;
    grp: TGroupBox;
    chkimp: TCheckBox;
    edData: TCMDateTimePicker;
    Label2: TLabel;
    spPag: TSpinEdit;
    Label4: TLabel;
    qryUnCusteio: TwwQuery;
    dblcUnCusteio: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblcUnCusteioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    Procedure FazRel;

  public
    { Public declarations }
  end;

var
  FrmParamLivroInvet: TFrmParamLivroInvet;

implementation

{$R *.DFM}

Uses uMensErro, uModulo, uSistema, dRptRelats;

procedure TFrmParamLivroInvet.FormCreate(Sender: TObject);
begin
  inherited;
  qryUnCusteio.Open;
  //
  qryAlmox.Close;
  qryAlmox.Params[0].Value := Sistema.idEmpresa;
  qryAlmox.Open;
  //
  qryGrpProd.Open;
  edData.Date := Modulo.LeDataRepresa;
end;

Procedure TFrmParamLivroInvet.FazRel;
Var
  sAlmox : String;
Begin
  sAlmox := '';
  If Trim(dblcUnCusteio.Text) <> '' Then
     DtmRptRelats.ppLabel259.Caption := 'Unidade de Custeio:'
  else
     DtmRptRelats.ppLabel259.Caption := 'Almoxarifado:';
  If (Trim(dblcUnCusteio.Text) = '')  and (Trim(dblcAlmox.Text) = '') Then
     DtmRptRelats.ppLabel270.Caption := 'Todos'
  else
     If Trim(dblcUnCusteio.Text) <> '' Then
        DtmRptRelats.ppLabel270.Caption := Trim(dblcUnCusteio.Text)
     else
        DtmRptRelats.ppLabel270.Caption := Trim(dblcAlmox.Text);
  if Trim(dblcAlmox.Text) <> '' Then
     Begin
        sAlmox := dblcAlmox.LookupValue;
     End
  Else
     Begin
        sAlmox := Modulo.ListAlmox(StrtoIntDef(dblcUnCusteio.LookupValue,0 ));
     End;
  DtmRptRelats.iPagNum           := spPag.Value;
  DtmRptRelats.LbDataRep.Caption := 'Estoque existente em : '+edData.Text;
  DtmRptRelats.LbGrp5.Caption    := 'Todos';
  With DtmRptRelats.qryLivroInvent Do
     Begin
        Close;
        Sql.Clear;
        Sql.Add(' SELECT                                                  ');
        Sql.Add('       AL.CODALMOXARIFADO, ');
        If Trim(dblcUnCusteio.Text) <> '' Then
           Sql.Add('    '+QuotedStr(dblcUnCusteio.Text)+'  AS DESCALMOX, ')
        Else
           Sql.Add('       AL.DESCALMOX, ');
        Sql.Add('       AR.CODARTIGO,                                     ');
        Sql.Add('       PR.DESCPROD,                                      ');
        Sql.Add('       PR.CODMEDCUSTO,                                   ');
        Sql.Add('       PR.CODFISCALPADRAO,                               ');
        Sql.Add('       PR.CODGRUPOPROD,                                  ');
        Sql.Add('       GP.DESCGRUPOPROD,                                 ');
        Sql.Add('       MV.SALDOQTDE,                                     ');
        Sql.Add('       MV.CUSTOMEDIO,                                    ');
        Sql.Add('       (MV.SALDOQTDE * MV.CUSTOMEDIO) AS VALTOTAL        ');
        Sql.Add(' FROM                                                    ');
        Sql.Add('      (                                                  ');
        Sql.Add('       SELECT                                            ');
        Sql.Add('           M.IDMOV,                                      ');
        Sql.Add('           M.CODARTIGO,                                  ');
        Sql.Add('           M.SALDOQTDEMOV AS SALDOQTDE,                  ');
        Sql.Add('           M.CUSTOMEDIOMOV AS CUSTOMEDIO,                ');
        Sql.Add('           M.CODALMOXARIFADO,                            ');
        Sql.Add('           M.IDPESSOA                                    ');
        Sql.Add('       FROM                                              ');
        Sql.Add('           MOVIMENT M,                                   ');
        Sql.Add('           ( SELECT                                      ');
        Sql.Add('                   M.CODARTIGO, M.CODALMOXARIFADO,       ');
        Sql.Add('                   MAX(M.IDMOV) AS IDMOV                 ');
        Sql.Add('              FROM MOVIMENT M,                           ');
        Sql.Add('                   (SELECT                               ');
        Sql.Add('                         CODARTIGO, CODALMOXARIFADO,     ');
        Sql.Add('                         MAX(DATAMOV) AS MAXDATAMOV      ');
        Sql.Add('                    FROM MOVIMENT                        ');
        Sql.Add('                    WHERE  (DATAMOV <= TO_DATE('''+EdData.Text+''',''DD/MM/YYYY'') )');
        If Trim(dblcAlmox.Text) <> '' Then
           Sql.Add('                       AND (CODALMOXARIFADO ='+ dblcAlmox.lookUpValue +') ')
        Else
           Sql.Add('                       AND (CODALMOXARIFADO  in ('+sAlmox+'))');
        Sql.Add('                    GROUP BY CODARTIGO, CODALMOXARIFADO             ');
        Sql.Add('                   ) SUB                                            ');
        Sql.Add('              WHERE                                                 ');
        Sql.Add('                    (M.CODARTIGO = SUB.CODARTIGO)                   ');
        Sql.Add('                AND (M.CODALMOXARIFADO = SUB.CODALMOXARIFADO)       ');
        Sql.Add('                AND (M.DATAMOV = SUB.MAXDATAMOV)                    ');
        If Trim(dblcAlmox.Text) <> '' Then
           Sql.Add('                AND (M.CODALMOXARIFADO ='+ dblcAlmox.lookUpValue +') ')
        Else
           Sql.Add('                AND (M.CODALMOXARIFADO  in ('+sAlmox+'))');
        Sql.Add('                AND (M.IDPESSOA   = '+IntToStr(Sistema.IdEmpresa)+' ) ');
        Sql.Add('             GROUP BY M.CODARTIGO, M.CODALMOXARIFADO ) AUX                          ');
        Sql.Add('       WHERE                                                   ');
        Sql.Add('              (M.CODARTIGO = AUX.CODARTIGO)                    ');
        Sql.Add('          AND (M.CODALMOXARIFADO = AUX.CODALMOXARIFADO)        ');
        If Trim(dblcAlmox.Text) <> '' Then
           Sql.Add('          AND (M.CODALMOXARIFADO ='+ dblcAlmox.lookUpValue +') ')
        Else
           Sql.Add('          AND (M.CODALMOXARIFADO  in ('+sAlmox+'))');
        Sql.Add('          AND (M.IDPESSOA   = '+IntToStr(Sistema.IdEmpresa)+' )');
        Sql.Add('          AND (M.IDMOV = AUX.IDMOV)                      ');
        Sql.Add('       ) MV,                                             ');
        Sql.Add('      ARTIGO AR,                                         ');
        Sql.Add('      PRODUTO PR,                                        ');
        Sql.Add('      GRUPPROD GP,                                       ');
        Sql.Add('      ALMOX AL                                           ');
        Sql.Add(' WHERE                                                   ');
        Sql.Add('    (AL.IDPESSOA   = '+IntToStr(Sistema.IdEmpresa)+' )');
        If Not chkimp.Checked Then
           sql.add('     AND (MV.SALDOQTDE <> 0)');
        If Trim(dblcGrpProd.Text) <> '' Then
           Begin
              Sql.Add('   AND (RTRIM(PR.CODGRUPOPROD) = '''+Trim(dblcGrpProd.LookUpValue)+''') ');
              DtmRptRelats.LbGrp5.Caption  := dblcGrpProd.Text;
           End;
        Sql.Add('   AND (AR.CODPRODUTO = PR.CODPRODUTO)            ');
        Sql.Add('   AND (AR.CODARTIGO  = MV.CODARTIGO)             ');
        Sql.Add('   AND (PR.CODGRUPOPROD = GP.CODGRUPOPROD)        ');
        Sql.Add('   AND (AL.CODALMOXARIFADO = MV.CODALMOXARIFADO)  ');
        Case RgOrdem.ItemIndex Of
           0 : Sql.Add(' ORDER BY AL.DESCALMOX,PR.CODGRUPOPROD, PR.DESCPROD   ');
           1 : Sql.Add(' ORDER BY AL.DESCALMOX,PR.CODGRUPOPROD, AR.CODARTIGO  ');
           2 : Sql.Add(' ORDER BY AL.DESCALMOX,PR.CODGRUPOPROD, VALTOTAL DESC ');
        End;
        Open;
     End;
End;

procedure TFrmParamLivroInvet.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazRel;
  ModalResult := mrOK;
end;

procedure TFrmParamLivroInvet.dblcUnCusteioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If (modified) And (Trim(dblcUnCusteio.Text) <> '') Then
      dblcAlmox.Text := '';
end;

end.
