unit FParamCurvaAltCustoMed;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, wwdblook, Db, DBTables, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamCurvaAltCustoMed = class(TfrmOkCancelar)
    qryGrpProd: TwwQuery;
    qryAlmox: TwwQuery;
    Label4: TLabel;
    dblcAlmox: TwwDBLookupCombo;
    Grp: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbedPercA: TRealEdit;
    dbedPercB: TRealEdit;
    dbedPercC: TRealEdit;
    rgImprimir: TRadioGroup;
    Label5: TLabel;
    dblcGrpProd: TwwDBLookupCombo;
    grpPeriodo: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    edDataI: TCMDateTimePicker;
    EdDataF: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure  FazRel;

  end;

var
  FrmParamCurvaAltCustoMed: TFrmParamCurvaAltCustoMed;

implementation

{$R *.DFM}

{ TFrmParamCurvaAltCustoMed }

Uses uMensErro, uSistema, DRptRelats;

procedure TFrmParamCurvaAltCustoMed.FazRel;
Var
   sGrupo     : String;
   spercDif   : String;
   cAux       : Char;
begin
  DtmRptRelats.LbAlmox16.Caption := dblcAlmox.Text;
  DtmRptRelats.LbGrupo5.Caption  := 'Todos';
  cAux := DecimalSeparator;
  DecimalSeparator := '.';
  Try
     sPercDif := 'DECODE(SIGN(MAX.CUSTOMEDIOMOV - MIN.CUSTOMEDIOMOV),-1, -1 *'+
                 ' ((( ABS(MAX.CUSTOMEDIOMOV - MIN.CUSTOMEDIOMOV)/DECODE(MIN.CUSTOMEDIOMOV,0,1,MIN.CUSTOMEDIOMOV) ) ) * 100), '+
                 ' ((( ABS(MAX.CUSTOMEDIOMOV - MIN.CUSTOMEDIOMOV)/DECODE(MIN.CUSTOMEDIOMOV,0,1,MIN.CUSTOMEDIOMOV) ) ) * 100)  '+
                 ' ) ';

     sGrupo   := ' DECODE(SIGN('+sPercDif+'-'+FloatToStr(dbedPercA.Value)+'),1,''A'','+
                  'DECODE(SIGN('+sPercDif+'-'+FloatToStr(dbedPercB.Value)+'),1,''B'','+
                  'DECODE(SIGN('+sPercDif+'-'+FloatToStr(dbedPercC.Value)+'),1,''C'',''D'')))';

     With DtmRptRelats.qryCurvaAltCustoMed Do
       Begin
          Close;
          Sql.Clear;
          Sql.Add('SELECT                    ');
          Sql.Add('   ('+sGrupo+') AS GRUPO, ');
          Sql.Add('    SUB.CODARTIGO,        ');
          Sql.Add('    P.DESCPROD,           ');
          Sql.Add('    P.CODMEDCUSTO,        ');
          Sql.Add('   (MIN.CUSTOMEDIOMOV) AS ULTCUSTOMED, ');
          Sql.Add('   (MAX.CUSTOMEDIOMOV) AS NOVOCUSTOMED,');
          Sql.Add('   (MAX.CUSTOMEDIOMOV - MIN.CUSTOMEDIOMOV) AS DIFCUSTOMED, ');
          Sql.Add('   ('+sPercDif+' ) AS PERCCUSTOMED,');
          Sql.Add('   (0) AS ULTPRECO,   ');
          Sql.Add('   (0) AS NOVOPRECO,  ');
          Sql.Add('   (0) AS DIFPRECO,   ');
          Sql.Add('   (0) AS PERCPRECO   ');
          Sql.Add('FROM                  ');
          Sql.Add('   MOVIMENT MIN,      ');
          Sql.Add('   MOVIMENT MAX,      ');
          Sql.Add('  (                   ');
          Sql.Add('   SELECT             ');
          Sql.Add('       UN.CODARTIGO,  ');
          Sql.Add('       MAX(UN.IDMAX) AS IDMAX, ');
          Sql.Add('       MAX(UN.IDMIN) AS IDMIN  ');
          Sql.Add('   FROM                        ');
          Sql.Add('   (                           ');
          Sql.Add('     SELECT                    ');
          Sql.Add('         M.CODARTIGO,          ');
          Sql.Add('         TO_DATE('''') AS DATA,  ');
          Sql.Add('         (0) AS IDMIN,         ');
          Sql.Add('         MAX(IDMOV) AS IDMAX   ');
          Sql.Add('     FROM                      ');
          Sql.Add('         MOVIMENT M            ');
          Sql.Add('     WHERE                     ');
          Sql.Add('             (M.CODALMOXARIFADO = '+dblcAlmox.LookupValue+') ');
          Sql.Add('         AND (M.DATAMOV >= TO_DATE('''+EdDataI.Text+''',''dd/mm/yyyy'')) ');
          Sql.Add('         AND (M.DATAMOV <= TO_DATE('''+EdDataF.Text+''',''dd/mm/yyyy'')) ');
          Sql.Add('         AND (M.IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) + ')');
          Sql.Add('     GROUP BY M.CODARTIGO         ');
          Sql.Add('     UNION                        ');
          Sql.Add('     SELECT                       ');
          Sql.Add('         M.CODARTIGO,             ');
          Sql.Add('         MIN(M.DATAMOV) AS DATA,  ');
          Sql.Add('         MIN(IDMOV) AS IDMIN,     ');
          Sql.Add('         (0) AS IDMAX             ');
          Sql.Add('     FROM                         ');
          Sql.Add('         MOVIMENT M               ');
          Sql.Add('     WHERE                        ');
          Sql.Add('             (M.CODALMOXARIFADO = '+dblcAlmox.LookupValue+') ');
          Sql.Add('         AND (M.DATAMOV >= TO_DATE('''+EdDataI.Text+''',''dd/mm/yyyy'')) ');
          Sql.Add('         AND (M.DATAMOV <= TO_DATE('''+EdDataF.Text+''',''dd/mm/yyyy'')) ');
          Sql.Add('         AND (M.IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) + ')');
          Sql.Add('     GROUP BY M.CODARTIGO         ');
          Sql.Add('     ) UN                         ');
          Sql.Add('     GROUP BY UN.CODARTIGO        ');
          Sql.Add('   ) SUB,                         ');
          Sql.Add('   PRODUTO P,                     ');
          Sql.Add('   ARTIGO A,                      ');
          Sql.Add('   GRUPPROD G                     ');
          Sql.Add('WHERE                             ');
          Sql.Add('        (SUB.CODARTIGO = A.CODARTIGO)     ');
          If trim(dblcGrpProd.Text) <> '' Then
            Begin
              Sql.Add(' AND (RTRIM(P.CODGRUPOPROD) LIKE '''+trim(dblcGrpProd.LookupValue)+'%'')');
              DtmRptRelats.LbGrupo5.Caption := dblcGrpProd.Text;
            End;
          Case rgImprimir.ItemIndex Of
             1 : Sql.Add(' AND (GRUPO = ''A'') ');
             2 : Sql.Add(' AND ((GRUPO = ''A'') OR (GRUPO = ''B'') )');
             3 : Sql.Add(' AND ((GRUPO = ''A'') OR (GRUPO = ''B'') OR (GRUPO = ''C''))');
          End;
          Sql.Add('    AND (SUB.IDMIN = MIN.IDMOV)           ');
          Sql.Add('    AND (SUB.IDMAX = MAX.IDMOV)           ');
          Sql.Add('    AND (A.CODPRODUTO = P.CODPRODUTO)     ');
          Sql.Add('    AND (G.CODGRUPOPROD = P.CODGRUPOPROD) ');
          Sql.Add('ORDER BY GRUPO, PERCCUSTOMED DESC         ');
          Open;
       End;
  Finally
     DecimalSeparator := cAux;
  End;
end;

procedure TFrmParamCurvaAltCustoMed.FormCreate(Sender: TObject);
begin
  inherited;
  qryAlmox.Close;
  qryAlmox.Params[0].AsInteger := Sistema.idEmpresa;
  qryAlmox.Open;
  //
  qryGrpProd.Open;
  //
  edDataI.Date := Date;
  edDataF.Date := Date;

end;

procedure TFrmParamCurvaAltCustoMed.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If trim(dblcAlmox.Text) = '' Then
    Begin
        MsgDlg('O Almoxarifado não foi preechido','Erro',mtError,[MbOk],0);
        dblcAlmox.SetFocus;
        ModalResult := mrNone;
    End
  Else
     FazRel;

end;

end.

