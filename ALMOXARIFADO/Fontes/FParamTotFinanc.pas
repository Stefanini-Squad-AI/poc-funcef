{-------------------------------------------------------------------------------
 Data       : 01.01.2007
 Autor      : Antonio Marcos Fernandes de Souza (amf)
 Pendência  : 24207
 Descrição  : adicionei checkboxes para que o usuário indique o destino dos itens(ativo fixo, custo ou estoque).
---------------------------------------------------------------------------------

// andre tavares - pendência 20205 - 24/10/2005 -  utilizei a funcao round(M.VALORMOV, 2) As VALOR para fechar com a contabilidade.}
unit FParamTotFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamTotFinanc = class(TfrmOkCancelar)
    grpPeriodo: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edDataI: TCMDateTimePicker;
    EdDataF: TCMDateTimePicker;
    qryUnCusteio: TwwQuery;
    Label3: TLabel;
    dblcUnCusteio: TwwDBLookupCombo;
    qryAlmox: TwwQuery;
    Label4: TLabel;
    dblcAlmox: TwwDBLookupCombo;
    chkEstoque: TCheckBox;
    chkDestEstoque: TCheckBox;
    chkDestAtivoFixo: TCheckBox;
    chkDestCusto: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;
var
  FrmParamTotFinanc: TFrmParamTotFinanc;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, DRptRelats;

procedure TFrmParamTotFinanc.FormCreate(Sender: TObject);
begin
  inherited;
  qryUnCusteio.Open;
  //
  qryAlmox.Close;
  qryAlmox.Params[0].asInteger := Sistema.IdEmpresa;
  qryAlmox.Open;
  //
  edDataI.Date := Date;
  edDataF.Date := Date;
end;

procedure TFrmParamTotFinanc.FazQry;
var
  sSelecionados: string;   // guardarei aqui a lista de selecionados ('E', 'A', 'C')
Begin
   DtmRptRelats.lbPer16.Caption  := ' De '+edDataI.Text+' a '+edDataF.Text+' ';
   With DtmRptRelats.qryTotFinanc Do
      Begin
         Close;
         Sql.Clear;

         if (chkDestAtivoFixo.Checked) then
            sSelecionados := QuotedStr('A')
         else if (chkDestCusto.Checked) then
                 sSelecionados := QuotedStr('C')
         else if (chkDestEstoque.Checked) then
                 sSelecionados := QuotedStr('E');

         if ((sSelecionados <> '') and (sSelecionados <> 'A')) then
         begin
           if (chkDestCusto.Checked) then
              sSelecionados :=  sSelecionados + ', ' + QuotedStr('A')
         end;

         if ((sSelecionados <> '') and (sSelecionados <> 'C')) then
         begin
           if (chkDestCusto.Checked) then
              sSelecionados :=  sSelecionados + ', ' + QuotedStr('C')
         end;

         if ((sSelecionados <> '') and (sSelecionados <> 'E')) then
         begin
           if (chkDestEstoque.Checked) then
              sSelecionados :=  sSelecionados + ', ' +  QuotedStr('E')
         end;

         if (trim(sSelecionados) <> '') then
            sql.Add(' SELECT DISTINCT                                                                ')
         else
            Sql.Add(' SELECT                                                                         ');

         Sql.Add('     A.CODALMOXARIFADO,                                                            ');
         Sql.Add('     A.DESCALMOX,                                                                  ');
         Sql.Add('     DECODE(VALANT.VALANT,NULL,0,VALANT.VALANT) AS VALANT,                         ');
         Sql.Add('     DECODE(VALCOMPRA.VALCOMPRA,NULL,0,VALCOMPRA.VALCOMPRA) AS VALCOMPRA,          ');
         Sql.Add('     DECODE(VALREQ.VALREQ,NULL,0,VALREQ.VALREQ) AS VALREQ,                         ');
         Sql.Add('     (DECODE(VALANT.VALANT,NULL,0,VALANT.VALANT)+                                  ');
         Sql.Add('     DECODE(VALCOMPRA.VALCOMPRA,NULL,0,VALCOMPRA.VALCOMPRA) -                      ');
         Sql.Add('     DECODE(VALREQ.VALREQ,NULL,0,VALREQ.VALREQ) -                                  ');
         Sql.Add('     DECODE(VALATU.VALATUAL,NULL,0,VALATU.VALATUAL) ) AS AJUSTE,                   ');
         Sql.Add('     DECODE(VALATU.VALATUAL,NULL,0,VALATU.VALATUAL) AS VALATUAL                    ');
         Sql.Add(' FROM                                                                              ');
         Sql.Add('     ALMOX A,                                                                      ');

         if (trim(sSelecionados) <> '') then
            Sql.Add('ITENSRECEBDEVOL IRD, ');

         Sql.Add('     (SELECT                                                                       ');
         Sql.Add('          VA.CODALMOXARIFADO,                                                      ');
         Sql.Add('          SUM(VA.VALOR) AS VALANT                                                  ');
         Sql.Add('     FROM                                                                          ');
         Sql.Add('     (                                                                             ');
         Sql.Add('     SELECT                                                                        ');
         Sql.Add('           M.CODALMOXARIFADO,                                                      ');
         Sql.Add('           M.CODARTIGO,                                                            ');
         Sql.Add('          (M.SALDOQTDEMOV * M.CUSTOMEDIOMOV) AS VALOR                              ');
         Sql.Add('     FROM                                                                         ');
         Sql.Add('          MOVIMENT M,                                                              ');
         Sql.Add('          ( SELECT                                                                 ');
         Sql.Add('      	    M.CODALMOXARIFADO,                                               ');
         Sql.Add('                  M.CODARTIGO,                                                     ');
         Sql.Add('                  MAX(M.IDMOV) AS IDMOV                                            ');
         Sql.Add('            FROM                                                                   ');
         Sql.Add('               MOVIMENT M,                                                         ');
         Sql.Add('               (                                                                   ');
         Sql.Add('                SELECT                                                             ');
         Sql.Add('                     M.CODALMOXARIFADO,                                              ');
         Sql.Add('                     M.CODARTIGO,                                                    ');
         Sql.Add('                     MAX(M.DATAMOV) AS DATAMOV                                       ');

         if (trim(sSelecionados) <> '') then
            Sql.Add('                FROM MOVIMENT M, ARTIGO A, PRODUTO P, ITENSRECEBDEVOL IRD0       ')
         else
            Sql.Add('                FROM MOVIMENT M, ARTIGO A, PRODUTO P       ');


         Sql.Add('                WHERE                                                                ');
         Sql.Add('                     (M.DATAMOV < TO_DATE('''+DateToStr(edDataI.Date)+''',''DD/MM/YYYY'')) ');

      If chkEstoque.Checked Then
         Sql.Add('                 AND (P.ITEMESTOCAVEL = ''S'')');

         Sql.Add('                 AND (M.CODARTIGO = A.CODARTIGO)                                   ');
         Sql.Add('                 AND (P.CODPRODUTO = A.CODPRODUTO)                                 ');

      if (trim(sSelecionados) <> '') then
      begin
         Sql.Add('                AND (M.IDMOV = IRD0.IDMOV) ');
         Sql.Add('                AND (A.CODARTIGO = IRD0.CODARTIGO) ');
         Sql.Add('                AND (IRD0.FLGDESTINO IN (' + sSelecionados + '))');
      end;


         Sql.Add('                GROUP BY M.CODALMOXARIFADO, M.CODARTIGO                            ');
         Sql.Add('                ) SUB1                                                             ');
         Sql.Add('            WHERE                                                                  ');
         Sql.Add('                 (M.CODARTIGO       = SUB1.CODARTIGO)                              ');
         Sql.Add('             AND (M.CODALMOXARIFADO = SUB1.CODALMOXARIFADO)                        ');
         Sql.Add('             AND (M.DATAMOV         = SUB1.DATAMOV)                                ');
         Sql.Add('             GROUP BY M.CODALMOXARIFADO, M.CODARTIGO                               ');

         if (trim(sSelecionados) <> '') then
            Sql.Add('            ) AUX, ITENSRECEBDEVOL IRD1                                         ')
         else
            Sql.Add('            ) AUX                                                               ');


         Sql.Add('      WHERE                                                                        ');
         Sql.Add('           (M.CODARTIGO       = AUX.CODARTIGO)                                     ');
         Sql.Add('       AND (M.CODALMOXARIFADO = AUX.CODALMOXARIFADO)                               ');
         Sql.Add('       AND (M.IDMOV           = AUX.IDMOV)                                         ');

      if (trim(sSelecionados) <> '') then
      begin
         Sql.Add('                AND (M.IDMOV = IRD1.IDMOV) ');
         Sql.Add('                AND (IRD1.FLGDESTINO IN (' + sSelecionados + '))');
      end;

         Sql.Add('     ) VA                                                                          ');
         Sql.Add('     GROUP BY VA.CODALMOXARIFADO ) VALANT,                                         ');
         Sql.Add('     (SELECT                                                                       ');
         Sql.Add('          VA.CODALMOXARIFADO,                                                      ');
         Sql.Add('          SUM(VA.VALOR) AS VALATUAL                                                  ');
         Sql.Add('     FROM                                                                          ');
         Sql.Add('     (                                                                             ');
         Sql.Add('     SELECT                                                                        ');
         Sql.Add('           M.CODALMOXARIFADO,                                                      ');
         Sql.Add('           M.CODARTIGO,                                                            ');
         Sql.Add('          (M.SALDOQTDEMOV * M.CUSTOMEDIOMOV) AS VALOR                              ');
         Sql.Add('      FROM                                                                         ');
         Sql.Add('          MOVIMENT M,                                                              ');
         Sql.Add('          ( SELECT                                                                 ');
         Sql.Add('      	    M.CODALMOXARIFADO,                                               ');
         Sql.Add('                  M.CODARTIGO,                                                     ');
         Sql.Add('                  MAX(M.IDMOV) AS IDMOV                                            ');
         Sql.Add('            FROM                                                                   ');
         Sql.Add('               MOVIMENT M,                                                         ');
         Sql.Add('               (                                                                   ');
         Sql.Add('                SELECT                                                             ');
         Sql.Add('                     M.CODALMOXARIFADO,                                            ');
         Sql.Add('                     M.CODARTIGO,                                                  ');
         Sql.Add('                     MAX(M.DATAMOV) AS DATAMOV                                     ');
         Sql.Add('                FROM MOVIMENT M,  ARTIGO A, PRODUTO P                              ');
         Sql.Add('                WHERE                                                              ');
         Sql.Add('                    (M.DATAMOV <= TO_DATE('''+DateToStr(edDataF.Date)+''',''DD/MM/YYYY'')) ');
      If chkEstoque.Checked Then
         Sql.Add('                 AND (P.ITEMESTOCAVEL = ''S'')');

         Sql.Add('                 AND (M.CODARTIGO = A.CODARTIGO)                                   ');
         Sql.Add('                 AND (P.CODPRODUTO = A.CODPRODUTO)                                 ');
         Sql.Add('                GROUP BY M.CODALMOXARIFADO, M.CODARTIGO                                ');
         Sql.Add('                ) SUB1                                                             ');
         Sql.Add('            WHERE                                                                  ');
         Sql.Add('                 (M.CODARTIGO       = SUB1.CODARTIGO)                              ');
         Sql.Add('             AND (M.CODALMOXARIFADO = SUB1.CODALMOXARIFADO)                        ');
         Sql.Add('             AND (M.DATAMOV         = SUB1.DATAMOV)                                ');
         Sql.Add('             GROUP BY M.CODALMOXARIFADO, M.CODARTIGO                               ');

         if (trim(sSelecionados) <> '') then
            Sql.Add('            ) AUX, ITENSRECEBDEVOL IRD2                                         ')
         else
            Sql.Add('            ) AUX                                                               ');

         Sql.Add('      WHERE                                                                        ');
         Sql.Add('           (M.CODARTIGO       = AUX.CODARTIGO)                                     ');
         Sql.Add('       AND (M.CODALMOXARIFADO = AUX.CODALMOXARIFADO)                               ');
         Sql.Add('       AND (M.IDMOV           = AUX.IDMOV)                                         ');

      if (trim(sSelecionados) <> '') then
      begin
         Sql.Add('                AND (M.IDMOV = IRD2.IDMOV) ');
         Sql.Add('                AND (IRD2.FLGDESTINO IN(' + sSelecionados + '))');
      end;


         Sql.Add('     ) VA                                                                          ');
         Sql.Add('     GROUP BY VA.CODALMOXARIFADO ) VALATU,                                         ');
         Sql.Add('     (SELECT                                                                       ');
         Sql.Add('           M.CODALMOXARIFADO,                                                      ');
         Sql.Add('           SUM(ROUND(M.VALORMOV, 2)) AS VALCOMPRA                                            ');
         Sql.Add('      FROM                                                                         ');

         if (trim(sSelecionados) <> '') then
            Sql.Add('          MOVIMENT M,  ARTIGO A, PRODUTO P, ITENSRECEBDEVOL IRD3                ')
         else
            Sql.Add('          MOVIMENT M,  ARTIGO A, PRODUTO P                                         ');


         Sql.Add('      WHERE                                                                        ');
         Sql.Add('            (M.DATAMOV >= TO_DATE('''+DateToStr(edDataI.Date)+''',''DD/MM/YYYY'')) ');
         Sql.Add('        AND (M.DATAMOV <= TO_DATE('''+DateToStr(edDataF.Date)+''',''DD/MM/YYYY'')) ');
      If chkEstoque.Checked Then
         Sql.Add('        AND (P.ITEMESTOCAVEL = ''S'')');

         Sql.Add('        AND (M.CODARTIGO = A.CODARTIGO)                                   ');
         Sql.Add('        AND (P.CODPRODUTO = A.CODPRODUTO)                                 ');
         Sql.Add('        AND ((M.CODTIPOMOV = ''K'') OR (M.CODTIPOMOV = ''A'') OR (M.CODTIPOMOV = ''B'') OR (M.CODTIPOMOV = ''Z'')) ');

      if (trim(sSelecionados) <> '') then
      begin
         Sql.Add('                AND (M.IDMOV = IRD3.IDMOV) ');
         Sql.Add('                AND (A.CODARTIGO = IRD3.CODARTIGO) ');
         Sql.Add('                AND (IRD3.FLGDESTINO IN (' + sSelecionados + '))');
      end;

         Sql.Add('      GROUP BY M.CODALMOXARIFADO                                                     ');
         Sql.Add('     ) VALCOMPRA,                                                                  ');
         Sql.Add('     (SELECT                                                                       ');
         Sql.Add('           M.CODALMOXARIFADO,                                                      ');
         Sql.Add('           SUM(round(M.VALORMOV, 2))*-1 AS VALREQ                                            ');
         Sql.Add('      FROM                                                                         ');

         if (trim(sSelecionados) <> '') then
            Sql.Add('          MOVIMENT M,  ARTIGO A, PRODUTO P, ITENSRECEBDEVOL IRD5               ')
         else
            Sql.Add('          MOVIMENT M,  ARTIGO A, PRODUTO P                                     ');


         Sql.Add('      WHERE                                                                        ');
         Sql.Add('            (M.DATAMOV >= TO_DATE('''+DateToStr(edDataI.Date)+''',''DD/MM/YYYY'')) ');
         Sql.Add('        AND (M.DATAMOV <= TO_DATE('''+DateToStr(edDataF.Date)+''',''DD/MM/YYYY'')) ');
      If chkEstoque.Checked Then
         Sql.Add('        AND (P.ITEMESTOCAVEL = ''S'')');
         Sql.Add('        AND (M.CODARTIGO = A.CODARTIGO)                                   ');
         Sql.Add('        AND (P.CODPRODUTO = A.CODPRODUTO)                                 ');
         Sql.Add('        AND ((M.CODTIPOMOV <> ''K'') AND (M.CODTIPOMOV <> ''A'') AND (M.CODTIPOMOV <> ''Z'') AND (M.CODTIPOMOV <> ''B'')) ');


      if (trim(sSelecionados) <> '') then
      begin
         Sql.Add('                AND (M.IDMOV = IRD5.IDMOV) ');
         Sql.Add('                AND (A.CODARTIGO = IRD5.CODARTIGO) ');
         Sql.Add('                AND (IRD5.FLGDESTINO IN (' + sSelecionados + '))');
      end;


         Sql.Add('      GROUP BY M.CODALMOXARIFADO                                                     ');
         Sql.Add('     ) VALREQ                                                                      ');
         Sql.Add(' WHERE                                                                             ');
     If Trim(dblcAlmox.Text) <> '' Then
       Begin
         DtmRptRelats.lbDisplay.Caption    := '      Almoxarifado :';
         DtmRptRelats.lbUnCusteio2.Caption := dblcAlmox.Text;
         Sql.Add('       (A.CODALMOXARIFADO = '+dblcAlmox.LookupValue+')')
       End
     Else
       Begin
         DtmRptRelats.lbDisplay.Caption    := 'Unidade de Custeio :';
         DtmRptRelats.lbUnCusteio2.Caption := dblcUnCusteio.Text;
         Sql.Add('       (A.CODCUSTEIO = '+dblcUnCusteio.LookupValue+')')
       End;
         Sql.Add('   AND (A.CODALMOXARIFADO = VALANT.CODALMOXARIFADO)       ');
         Sql.Add('   AND (A.CODALMOXARIFADO = VALATU.CODALMOXARIFADO)       ');
         Sql.Add('   AND (A.CODALMOXARIFADO = VALCOMPRA.CODALMOXARIFADO(+)) ');
         Sql.Add('   AND (A.CODALMOXARIFADO = VALREQ.CODALMOXARIFADO(+))    ');


      if (trim(sSelecionados) <> '') then
      begin
         Sql.Add('                AND (A.CODALMOXARIFADO = IRD.CODALMOXARIFADO(+)) ');
         Sql.Add('                AND (A.CODCENTROCUSTO = IRD.CODCENTROCUSTO(+)) ');
         Sql.Add('                AND (A.IDPESSOA = IRD.IDPESSOA(+)) ');
         Sql.Add('                AND (IRD.FLGDESTINO IN (' + sSelecionados + '))');
      end;

         Sql.Add(' ORDER BY A.DESCALMOX                                     ');

        Open;
      End;
End;
procedure TFrmParamTotFinanc.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If (Trim(dblcAlmox.Text) = '') And (Trim(dblcUnCusteio.Text) = '') Then
     Begin
        MsgDlg('Unidade de Custeio não preenchido','Erro',mtError,[mbOk],0 );
        dblcUnCusteio.SetFocus;
        ModalResult := mrNone;
     End
  Else
  If Trim(edDataI.Text) = '' Then
     Begin
        MsgDlg('Data de Início não preenchido','Erro',mtError,[mbOk],0 );
        edDataI.SetFocus;
        ModalResult := mrNone;
     End
  Else
  If Trim(edDataF.Text) = '' Then
     Begin
        MsgDlg('Data final não preenchido','Erro',mtError,[mbOk],0 );
        edDataI.SetFocus;
        ModalResult := mrNone;
     End
  Else
  If (edDataI.Date  > edDataF.Date ) Then
     Begin
        MsgDlg('Data de inicio não pode ser maior que a data final','Erro',mtError,[mbOk],0 );
        edDataI.SetFocus;
        ModalResult := mrNone;
     End
  Else
    Begin
        ModalResult := mrOK;
        FazQry;
    End;
end;

end.
