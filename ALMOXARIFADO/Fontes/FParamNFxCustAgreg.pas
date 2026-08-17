// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit FParamNFxCustAgreg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, Db,
  DBTables, Wwquery, wwdblook, CMDBLookupCombo;

type
  TFrmParamNFxCustAgreg = class(TfrmOkCancelar)
    gbDatas: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edDataIni: TCMDateTimePicker;
    edDataFim: TCMDateTimePicker;
    RgNota: TRadioGroup;
    qryAgregado: TwwQuery;
    dblcAgregado: TCMDBLookupCombo;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazerQry;
  public
    { Public declarations }
  end;

var
  FrmParamNFxCustAgreg: TFrmParamNFxCustAgreg;

implementation

{$R *.DFM}

Uses DRptRelats, uMensErro, uSistema;

Procedure TFrmParamNFxCustAgreg.FazerQry;
Begin
    With DtmRptRelats.qryNFxCustAgreg Do
     Begin
         Close;
         Sql.Clear;
         Sql.Add(' SELECT                                                                          ');
         Sql.Add('     NF.DATAENTDEVOL,                                                            ');
         Sql.Add('     NF.DATAEMISNF,                                                              ');
         Sql.Add('     P.RAZAOSOCIAL,                                                              ');
         Sql.Add('     (TO_CHAR(NF.NUMNF) || ''/'' || NF.COMPLNF) AS NOTANUM,                      ');
         Sql.Add('     NF.VLRNOTAFISCAL,                                                           ');
         Sql.Add('     NF.FLGTIPONOTA,                                                             ');
         Sql.Add('     SUB.ALIQUOTA AS ALIQUOTA,   ');
         Sql.Add('     SUB.BASE   AS BASE,         ');
         Sql.Add('     SUB.VALOR  AS VALOR,        ');
         Sql.Add('     SUB.RECUP  AS RECUP,        ');
         Sql.Add('     SUB.DESCCUSTAGREG AS DESCRICAO,      ');
         Sql.Add('     DECODE(SUB.TIPO,''T'',''NOTA'',DECODE(SUB.TIPO,''I'',''ITEM'','''')) AS TIPO ');
         Sql.Add('  FROM                                                                     ');
         Sql.Add('        NFRECEBDEVOL NF,                                                   ');
         Sql.Add('          ( SELECT                                                         ');
         Sql.Add('                 NF.IDNFRECEBDEVOL,                                        ');
         Sql.Add('                 AIT.CODTIPOCUSTAGREG,                                     ');
         Sql.Add('                 AIT.ALIQUOTA,                                             ');
         Sql.Add('                 TA.DESCCUSTAGREG,                                         ');
         Sql.Add('                 (''I'') AS TIPO,                                          ');
         Sql.Add('                 SUM(AIT.BASECALCULO)  AS BASE,                            ');
         Sql.Add('                 SUM(AIT.VLRAGREGADO)  AS VALOR,                           ');
         Sql.Add('                 SUM(AIT.VLRRECUPERADO)AS RECUP                            ');
         Sql.Add('            FROM                                                           ');
         Sql.Add('                 NFRECEBDEVOL NF,                                          ');
         Sql.Add('                 ITENSRECEBDEVOL IT,                                       ');
         Sql.Add('                 AGRITENSRECDEV  AIT,                                      ');
         Sql.Add('                 TIPOAGRE  TA                                              ');
         Sql.Add('            WHERE                                                          ');

     Case RgNota.ItemIndex Of
        0: Sql.Add('                (NF.FLGTIPONOTA <> ''D'')                                     ');
        1: Sql.Add('                (NF.FLGTIPONOTA = ''D'')                                      ');
     End;
         Sql.Add('              AND (TA.TOTALITEM = ''I'')                                        ');
         Sql.Add('              AND (NF.DATAENTDEVOL >= TO_DATE('''+DateToStr(EdDataINI.Date)+''',''dd/mm/yyyy''))');
         Sql.Add('              AND (NF.DATAENTDEVOL <= TO_DATE('''+DateToStr(EdDataFIM.Date)+''',''dd/mm/yyyy''))');
         Sql.Add('              AND (NF.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')');

     If Trim(dblcAgregado.Text) <> '' Then
         Sql.Add('              AND (AIT.CODTIPOCUSTAGREG = '+dblcAgregado.LookupValue+')   ');

         Sql.Add('              AND (NF.IDNFRECEBDEVOL    = IT.IDNFRECEBDEVOL)               ');
         Sql.Add('              AND (AIT.CODTIPOCUSTAGREG = TA.CODTIPOCUSTAGREG)             ');
         sql.Add('              AND (AIT.IDITENSRECDEV    = IT.IDITENSRECDEV)                ');
         Sql.Add('            GROUP BY NF.IDNFRECEBDEVOL,                                    ');
         Sql.Add('                     AIT.CODTIPOCUSTAGREG,                                 ');
         Sql.Add('                     AIT.ALIQUOTA,TA.DESCCUSTAGREG                         ');
         Sql.Add('          UNION                                                        ');
         Sql.Add('          SELECT                                                           ');
         Sql.Add('                 NF.IDNFRECEBDEVOL,                                        ');
         Sql.Add('                 ANF.CODTIPOCUSTAGREG,                                     ');
         Sql.Add('                 ANF.ALIQUOTA,                                             ');
         Sql.Add('                 TA.DESCCUSTAGREG,                                         ');
         Sql.Add('                 (''T'') AS TIPO,                                          ');
         Sql.Add('                 SUM(ANF.BASECALCULO)   AS BASE,                           ');
         Sql.Add('                 SUM(ANF.VLRAGREGADO)   AS VALOR,                          ');
         Sql.Add('                 SUM(ANF.VLRRECUPERADO) AS RECUP                           ');
         Sql.Add('            FROM                                                           ');
         Sql.Add('                 NFRECEBDEVOL NF,                                          ');
         Sql.Add('                 AGRNFRECDEV  ANF,                                         ');
         Sql.Add('                 TIPOAGRE  TA                                              ');
         Sql.Add('            WHERE                                                          ');
     Case RgNota.ItemIndex Of
        0: Sql.Add('                (NF.FLGTIPONOTA <> ''D'')                                ');
        1: Sql.Add('                (NF.FLGTIPONOTA = ''D'')                                 ');
     End;
         Sql.Add('              AND (TA.TOTALITEM = ''T'')                                   ');
         Sql.Add('              AND (ANF.IDNFCOMPLEMENTAR IS NULL)                           ');
         Sql.Add('              AND (NF.DATAENTDEVOL >= TO_DATE('''+DateToStr(EdDataINI.Date)+''',''dd/mm/yyyy''))');
         Sql.Add('              AND (NF.DATAENTDEVOL <= TO_DATE('''+DateToStr(EdDataFIM.Date)+''',''dd/mm/yyyy''))');
         Sql.Add('              AND (NF.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')');

     If Trim(dblcAgregado.Text) <> '' Then
         Sql.Add('              AND (ANF.CODTIPOCUSTAGREG = '+dblcAgregado.LookupValue+')   ');

         Sql.Add('              AND (ANF.IDNFRECEBDEVOL   = NF.IDNFRECEBDEVOL)               ');
         Sql.Add('              AND (ANF.CODTIPOCUSTAGREG = TA.CODTIPOCUSTAGREG)             ');
         Sql.Add('            GROUP BY  NF.IDNFRECEBDEVOL,                                   ');
         Sql.Add('                      ANF.CODTIPOCUSTAGREG,                                ');
         Sql.Add('                      ANF.ALIQUOTA,TA.DESCCUSTAGREG                                        ');
         Sql.Add('          ) SUB,                                                           ');
         Sql.Add('      PESSOA P                                                             ');
         Sql.Add('   WHERE                                                                   ');
     Case RgNota.ItemIndex Of
        0: Sql.Add('            (NF.FLGTIPONOTA <> ''D'')                                    ');
        1: Sql.Add('            (NF.FLGTIPONOTA = ''D'')                                     ');
     End;

         Sql.Add('        AND (NF.DATAENTDEVOL >= TO_DATE('''+DateToStr(EdDataINI.Date)+''',''dd/mm/yyyy''))      ');
         Sql.Add('        AND (NF.DATAENTDEVOL <= TO_DATE('''+DateToStr(EdDataFIM.Date)+''',''dd/mm/yyyy''))      ');
         Sql.Add('        AND (NF.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+') ');
         Sql.Add('        AND (NF.IDFORCLI = P.IDPESSOA)                      ');
     If Trim(dblcAgregado.Text) <> '' Then
         Sql.Add('        AND (NF.IDNFRECEBDEVOL =  SUB.IDNFRECEBDEVOL)    ')
     Else
         Sql.Add('        AND (NF.IDNFRECEBDEVOL =  SUB.IDNFRECEBDEVOL)    ');

         Sql.Add('   ORDER BY NF.DATAENTDEVOL, P.RAZAOSOCIAL, NOTANUM ');
         //Sql.SaveToFile('c:\chabu.sql');
         Sql.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\chabu.sql');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
         Open;

     End;
     DtmRptRelats.lbPer11.Caption := ' De '+EdDataINI.Text+ ' a '+EdDataFIM.Text +' ';
End;

procedure TFrmParamNFxCustAgreg.FormCreate(Sender: TObject);
begin
  inherited;
  edDataIni.Date := Date;
  edDataFim.Date := Date;
  
  qryAgregado.Open;
end;

procedure TFrmParamNFxCustAgreg.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if Trim(edDataIni.Text) = '' Then
     Begin
      MsgDlg('Data de início não preenchida','Erro',mtError,[mbOK],0);
      edDataIni.SetFocus;
      ModalResult := MrNone;
     End
  Else
  if Trim(edDataFim.Text) = '' Then
     Begin
         MsgDlg('Data de início não preenchida','Erro',mtError,[mbOK],0);
         edDataFim.SetFocus;
         ModalResult := MrNone;
     End
  Else
  if edDataFim.Date < edDataIni.Date Then
     Begin
         MsgDlg('Data de início não poder ser maior que a final','Erro',mtError,[mbOK],0);
         edDataFim.SetFocus;
         ModalResult := MrNone;
     End
  Else
     Begin
       FazerQry;
       ModalResult := MrOk;
     End;
end;

end.


