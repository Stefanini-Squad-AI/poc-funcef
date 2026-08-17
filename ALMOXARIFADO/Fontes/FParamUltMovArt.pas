// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit FParamUltMovArt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
  Db, DBTables, Wwquery;

type
  TFrmParamUltMovArt = class(TfrmOkCancelar)
    qryAlmox: TwwQuery;
    qryGrpProd: TwwQuery;
    Label3: TLabel;
    dblcAlmox: TwwDBLookupCombo;
    Label5: TLabel;
    dblcGrpProd: TwwDBLookupCombo;
    Label1: TLabel;
    edData: TCMDateTimePicker;
    RgOrdem: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazRel;
  public
    { Public declarations }
  end;

var
  FrmParamUltMovArt: TFrmParamUltMovArt;

implementation

{$R *.DFM}

{ TFrmParamUltMovArt }

uses DRptRelats, uMensErro,  uSistema;

procedure TFrmParamUltMovArt.FazRel;
begin
   With DtmRptRelats.QryUltMovArt Do
      Begin
         Close;
         Sql.Clear;
         Sql.Add(' SELECT                  ');
         Sql.Add('      M.IDMOV,           ');
         Sql.Add('      M.CODARTIGO,       ');
         Sql.Add('      P.DESCPROD,        ');
         Sql.Add('      M.DATAMOV,         ');         
         Sql.Add('      M.SALDOQTDEMOV,    ');
         Sql.Add('      M.QTDEMOV,         ');
         Sql.Add('      P.CODMEDCUSTO,     ');
         Sql.Add('      M.CUSTOMEDIOMOV,   ');
         Sql.Add('      M.CODTIPOMOV,   ');
         Sql.Add('      T.DESCRESUMIDA     ');
         Sql.Add('  FROM ');
         Sql.Add('       MOVIMENT M, ');
         Sql.Add('       ( SELECT ');
         Sql.Add('               M.CODARTIGO, ');
         Sql.Add('               MAX(M.IDMOV) AS IDMOV ');
         Sql.Add('          FROM ');
         Sql.Add('               MOVIMENT M, ');
         Sql.Add('              (SELECT ');
         Sql.Add('                    CODARTIGO, ');
         Sql.Add('                    MAX(DATAMOV) AS MAXDATAMOV ');
         Sql.Add('               FROM MOVIMENT ');
         Sql.Add('               WHERE  ( DATAMOV <= TO_DATE('''+ EdData.Text+''',''DD/MM/YYYY'') )');
         Sql.Add('                  AND (CODALMOXARIFADO  = '+ dblcAlmox.lookUpValue+')');
         Sql.Add('               GROUP BY CODARTIGO ');
         Sql.Add('              ) SUB ');
         Sql.Add('         WHERE (M.CODARTIGO = SUB.CODARTIGO)');
         Sql.Add('           AND (M.DATAMOV =SUB.MAXDATAMOV) ');
         Sql.Add('           AND (M.CODALMOXARIFADO ='+ dblcAlmox.lookUpValue +') ');
         Sql.Add('         GROUP BY M.CODARTIGO ) AUX, ');
         Sql.Add('       PRODUTO P, ');
         Sql.Add('       ARTIGO A,  ');
         Sql.Add('       TIPOMOV T  ');
         Sql.Add(' WHERE ');
         Sql.Add('      (M.CODALMOXARIFADO = '+ dblcAlmox.lookUpValue +') ');
         Sql.Add('  AND (M.CODARTIGO = AUX.CODARTIGO) ');
         Sql.Add('  AND (M.IDMOV = AUX.IDMOV)         ');
         If  Trim(dblcGrpProd.Text) <> ''  Then
            Begin
               sql.Add(' AND (RTRIM(P.CODGRUPOPROD) LIKE '''+dblcGrpProd.LookUpValue+''' || ''%'' ) ');
               DtmRptRelats.lbGrupo4.Caption  := dblcGrpProd.LookupValue + ' - '+ dblcGrpProd.Text;
            End;
         Sql.Add('  AND (M.CODARTIGO = A.CODARTIGO)   ');
         Sql.Add('  AND (A.CODPRODUTO = P.CODPRODUTO) ');
         Sql.Add('  AND (A.CODPRODUTO = P.CODPRODUTO) ');
         Sql.Add('  AND (M.CODTIPOMOV = T.CODTIPOMOV) ');
         
         Case RgOrdem.ItemIndex Of
             0 : sql.Add(' ORDER BY P.DESCPROD  ');
             1 : sql.Add(' ORDER BY M.CODARTIGO ');
         End;
         //Sql.saveToFile('c:\chabu.sql');
         Sql.saveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\chabu.sql');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
         Open;
      End;
end;

procedure TFrmParamUltMovArt.FormCreate(Sender: TObject);
begin
  inherited;
  qryAlmox.Close;
  qryAlmox.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
  qryAlmox.Open;
  //
  qryGrpProd.Open;
  //
  edData.Date := Date;
end;

procedure TFrmParamUltMovArt.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If trim(dblcAlmox.Text) = '' Then
    Begin
        MsgDlg('Almoxarifado não preenchido','Erro',mtError,[mbOk],0);
        dblcAlmox.SetFocus;
        ModalResult := mrNone;
    End
  Else
  If trim(edData.Text) = '' Then
    Begin
        MsgDlg('Data limite não preenchido','Erro',mtError,[mbOk],0);
        edData.SetFocus;
        ModalResult := mrNone;
    End
  Else
    FazRel;
    DtmRptRelats.lbAlmox15.Caption  := dblcAlmox.Text;
    DtmRptRelats.lbData2.Caption    := 'Até '+ edData.Text;
end;

end.
