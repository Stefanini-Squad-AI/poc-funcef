//************************************************************************************************************************
//Atualizado por : André Tavares - 11/12/2003 - pendência 15763 - alterei a query no SqlAutoriza e comentei a query antiga
{===============================================================================
{===============================================================================
//  Data      : 17/11/2012
//  Autor     : Higor Nayde Ferreira	
//  Rotina    : MontaArvoreRelatorio
//  Pendência : SOL 195642 Kintana 1869273
//  Descrição : Voltar versão do sol 143297.12044  pois não havia enviado em 
//  			pacote extra
//==============================================================================
{===============================================================================
//  Data      : 17/10/2012
//  Autor     : Fernando Xavier
//  Rotina    : MontaArvoreRelatorio
//  Pendência : SOL 143297.12044 Kintana 1832792
//  Descrição : Alteração no order by adicionado o nome do relatorio na ordenação
//==============================================================================
Analista  : Thiago Melo
Método    : MontaArvoreConsulta, InsereArvoreRecursiva(Inclusão de Procedure)
Pendência : SOL 143297 Kintana 928391
Descrição : Foi adicionado condições para inclusão de grupo mestre no
            MontaArvoreRelatorio.
===============================================================================
Analista  : Vinicius Eduardo Nascimento Maciel
Método    : SqlReports
Pendência : SOL 168857/ KTN 1506883
Descrição : Alterei a propriedade sql desse componente, adicionei a clausula "
            AND(R.FLGRELATATIVO = 'S') "
===============================================================================
Analista  : Vinícius
Método    : Diversos
Pendência : 17429
Descrição : Inclusão do parâmetro TipoCliente no SQLEmpresaProp
===============================================================================}



unit DAutorizacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, wwQuery, fcTreeView, DBClient, uCmSqlParams, Wwdatsrc;

type
  TDtmAutorizacao = class(TDataModule)
    QryAtuAutorizaRpt: TwwQuery;
    QryAtuAutorizaRptIDREPORTS: TFloatField;
    QryAtuAutorizaRptORIGEMCM: TFloatField;
    QryAtuAutorizaRptIDEMPRESA: TFloatField;
    QryAtuAutorizaRptIDESPACESSO: TFloatField;
    UpdAtuAutorizaRpt: TUpdateSQL;
    QryAtuAutorizaConsulta: TwwQuery;
    QryAtuAutorizaConsultaIDMONTASELECT: TFloatField;
    QryAtuAutorizaConsultaIDEMPRESA: TFloatField;
    QryAtuAutorizaConsultaIDESPACESSO: TFloatField;
    UpdAtuAutorizaConsulta: TUpdateSQL;
    SqlObjeto: TCMSqlParams;
    CdsObjeto: TClientDataSet;
    SqlUsuario: TCMSqlParams;
    CdsUsuario: TClientDataSet;
    SqlParamGlobal: TCMSqlParams;
    CdsParamGlobal: TClientDataSet;
    SqlEmpresaProp: TCMSqlParams;
    CdsEmpresaProp: TClientDataSet;
    SqlConsulta: TCMSqlParams;
    CdsConsulta: TClientDataSet;
    SqlAutorizaConsulta: TCMSqlParams;
    CdsAutorizaConsulta: TClientDataSet;
    SqlReports: TCMSqlParams;
    CdsReports: TClientDataSet;
    SqlAutorizaRpt: TCMSqlParams;
    CdsAutorizaRpt: TClientDataSet;
    SqlAutoriza: TCMSqlParams;
    CdsAutoriza: TClientDataSet;
    SqlHistSenha: TCMSqlParams;
    CdsHistSenha: TClientDataSet;
    SqlLoadReports: TCMSqlParams;
    CdsLoadReports: TClientDataSet;
    SqlModeloReports: TCMSqlParams;
    CdsModeloReports: TClientDataSet;
    dsFluxOper: TwwDataSource;
    dsPasso: TwwDataSource;
    SqlPasso: TCMSqlParams;
    CdPasso: TClientDataSet;
    SqlFluxOper: TCMSqlParams;
    CdsFluxOper: TClientDataSet;
    procedure dsFluxOperDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MontaArvoreRelatorio(TreeReports: TfcTreeView; IdEmpresa, IdUsuario, IdModulo, IdEspacesso:LongInt; ExibeCheck, ExibeGlobal: Boolean;
              bAddAllReports: Boolean = True);
    procedure MontaArvoreConsulta(TreeConsulta: TfcTreeView; IdEmpresa, IdUsuario, IdModulo, IdEspacesso:LongInt; ExibeCheck, ExibeGlobal: Boolean);
    procedure InsereArvoreRecursiva (TreeReports: TfcTreeView; Pai : TfcTreeNode; Cds : TClientDataSet;
                                     idGrupoRelatorio : Double; ExibeCheck, ExibeGlobal, bAddAllReports: Boolean;
                                     IdEmpresa, IdUsuario, IdModulo, IdEspacesso : LongInt);
  end;

var
  DtmAutorizacao: TDtmAutorizacao;

implementation

{$R *.DFM}
uses UAutorizacao, FCMPrincipalForms;

procedure TdtmAutorizacao.MontaArvoreRelatorio(TreeReports: TfcTreeView; IdEmpresa,
          IdUsuario, IdModulo, IdEspacesso:LongInt; ExibeCheck, ExibeGlobal: Boolean;
          bAddAllReports: Boolean = True);
Var
    SOldNome, SOldGrupo: String;
    TreePai, TreeFilho, TreeGrupo: TfcTreeNode;

    Numero : Double;

    qryGrupo, qryGrupos, qryAux : TwwQuery;
Begin
  With SqlAutorizaRpt Do
  Begin
     Prepare;
     ParamByName('IDEMPRESA').AsFloat := IdEmpresa;
     ParamByName('IDUSUARIO').AsFloat := IdUsuario;
     ParamByName('IDMODULO').AsFloat := IdModulo;

     If ExibeGlobal Then
        ParamByName('IDMODULO2').AsFloat := 2
     Else
        ParamByName('IDMODULO2').AsFloat := IdModulo;

     ParamByName('IDESPACESSO').AsFloat := IdEspacesso;
     Open;
  End;

  With SqlReports Do
  Begin
     
     {
      Alterei trocando o
        ((C.IDPESSOA = :IDPESSOA) OR (C.IDPESSOA IS NULL)) AND
      por
         (C.IDPESSOA(+) = :IDPESSOA) AND
      Pois os relatórios configurados não apareciam para outras empresas
     }

     SqlReports.Prepare;
     ParamByName('IDMODULO').AsFloat := IdModulo;

     If ExibeGlobal Then
        ParamByName('IDMODULO2').AsFloat := 2
     Else
        ParamByName('IDMODULO2').AsFloat := IdModulo;

     ParamByName('IDPESSOA').AsFloat := IdEmpresa;
     Open;
  End;

  sOldNome := '';
  sOldGrupo := '';
  TreePai := nil;
  TreeGrupo := nil;

  TreeReports.Items.Clear;

  // Thiago Melo SOL 143297 Kintana 928391

  qryGrupo              := TwwQuery.Create(Self);
  qryGrupo.DatabaseName := 'BaseDados';

  qryAux              := TwwQuery.Create(Self);
  qryAux.DatabaseName := 'BaseDados';

  try
    qryGrupo.Close;
    qryGrupo.Sql.Clear;
    qryGrupo.Sql.Add('SELECT M.NOMEMODULO');
    qryGrupo.Sql.Add(' FROM REPORTS R, MODULO M, GRUPORELATORIO G, CONFIGREPORTSCM C');
    qryGrupo.Sql.Add('WHERE ((R.IDMODULO = :IDMODULO) OR');
    qryGrupo.Sql.Add('    ((R.IDMODULO = :IDMODULO2) AND (R.IDDATAVIEW IS NOT NULL)))');
    qryGrupo.Sql.Add('  AND (R.IDMODULO = M.IDMODULO)');
    qryGrupo.Sql.Add('  AND (R.IDGRUPORELATORIO = G.IDGRUPORELATORIO(+))');
    qryGrupo.Sql.Add('  AND (R.ORIGEMCMGR = G.ORIGEMCMGR(+))');
    qryGrupo.Sql.Add('  AND (R.IDREPORTS = C.IDREPORTS(+))');
    qryGrupo.Sql.Add('  AND (R.ORIGEMCM = C.ORIGEMCM(+))');
    qryGrupo.Sql.Add('  AND (C.IDPESSOA(+) = :IDPESSOA)');
    qryGrupo.Sql.Add('  AND (R.FLGTIPO IS NULL OR R.FLGTIPO = ' + QuotedStr('R') + ')');
    qryGrupo.Sql.Add('  AND (R.FLGRELATATIVO = ' + QuotedStr('S') + ')');
    if not bAddAllReports then begin
      qryGrupo.Sql.Add('AND (R.FLGEXIBENOPREVIEW <> ' + QuotedStr('N') + ')');
    end;
    qryGrupo.Sql.Add('GROUP BY M.NOMEMODULO');
    qryGrupo.Sql.Add('ORDER BY M.NOMEMODULO');

    qryGrupo.Params.Clear;
    qryGrupo.Params.CreateParam(ftInteger, 'IDMODULO', ptInput);
    qryGrupo.ParamByName('IDMODULO').AsInteger := IdModulo;

    qryGrupo.Params.CreateParam(ftInteger, 'IDMODULO2', ptInput);
    if ExibeGlobal then begin
      qryGrupo.ParamByName('IDMODULO2').AsFloat := 2
    end
    else begin
      qryGrupo.ParamByName('IDMODULO2').AsFloat := IdModulo;
    end;

    qryGrupo.Params.CreateParam(ftInteger, 'IDPESSOA', ptInput);
    qryGrupo.ParamByName('IDPESSOA').AsFloat := IdEmpresa;

    qryGrupo.Prepare;
    try
      qryGrupo.Open;
    except
      qryGrupo.Close;
      FreeAndNil(qryGrupo);
      Exit;
    end;

    while (not qryGrupo.Eof) do begin
      // Carregando Grupos
      TreePai := TreeReports.Items.Add(nil,qryGrupo.FieldByName('NOMEMODULO').AsString);
      TreePai.ImageIndex    := 0;
      TreePai.SelectedIndex := 0;

      qryGrupos              := TwwQuery.Create(Self);
      qryGrupos.DatabaseName := 'BaseDados';
      try
        qryGrupos.Close;
        qryGrupos.Sql.Clear;
        qryGrupos.Sql.Add('SELECT M.NOMEMODULO, G.DESCRICAO');
        qryGrupos.Sql.Add(' FROM REPORTS R, MODULO M, GRUPORELATORIO G, CONFIGREPORTSCM C');
        qryGrupos.Sql.Add('WHERE ((R.IDMODULO = :IDMODULO) OR');
        qryGrupos.Sql.Add('    ((R.IDMODULO = :IDMODULO2) AND (R.IDDATAVIEW IS NOT NULL)))');
        qryGrupos.Sql.Add('  AND (R.IDMODULO = M.IDMODULO)');
        qryGrupos.Sql.Add('  AND (R.IDGRUPORELATORIO = G.IDGRUPORELATORIO(+))');
        qryGrupos.Sql.Add('  AND (R.ORIGEMCMGR = G.ORIGEMCMGR(+))');
        qryGrupos.Sql.Add('  AND (R.IDREPORTS = C.IDREPORTS(+))');
        qryGrupos.Sql.Add('  AND (R.ORIGEMCM = C.ORIGEMCM(+))');
        qryGrupos.Sql.Add('  AND (C.IDPESSOA(+) = :IDPESSOA)');
        qryGrupos.Sql.Add('  AND (R.FLGTIPO IS NULL OR R.FLGTIPO = ' + QuotedStr('R') + ')');
        qryGrupos.Sql.Add('  AND (R.FLGRELATATIVO = ' + QuotedStr('S') + ')');
        qryGrupos.Sql.Add('  AND (M.NOMEMODULO = ' + QuotedStr(qryGrupo.FieldByName('NOMEMODULO').AsString) + ')');
        qryGrupos.Sql.Add('  AND G.IDGRUPOMESTRE = 0');
        qryGrupos.Sql.Add('GROUP BY M.NOMEMODULO, G.DESCRICAO');
//        qryGrupos.Sql.Add('ORDER BY M.NOMEMODULO');
        qryGrupos.Sql.Add('ORDER BY G.DESCRICAO');


        qryGrupos.Params.Clear;
        qryGrupos.Params.CreateParam(ftInteger, 'IDMODULO', ptInput);
        qryGrupos.ParamByName('IDMODULO').AsInteger := IdModulo;

        qryGrupos.Params.CreateParam(ftInteger, 'IDMODULO2', ptInput);
        if ExibeGlobal then begin
          qryGrupos.ParamByName('IDMODULO2').AsFloat := 2;
        end
        else begin
          qryGrupos.ParamByName('IDMODULO2').AsFloat := IdModulo;
        end;

        qryGrupos.Params.CreateParam(ftInteger, 'IDPESSOA', ptInput);
        qryGrupos.ParamByName('IDPESSOA').AsFloat := IdEmpresa;

        qryGrupos.Prepare;
        try
          qryGrupos.Open;
        except
          qryGrupos.Close;
          FreeAndNil(qryGrupos);
          Exit;
        end;

        if not qryGrupos.IsEmpty then begin
          while not qryGrupos.Eof do begin

            TreeGrupo := TreeReports.Items.AddChild(TreePai,qryGrupos.FieldByName('DESCRICAO').AsString);
            TreeGrupo.ImageIndex := 3;
            TreeGrupo.SelectedIndex := 3;

            qryAux.Close;
            qryAux.Sql.Clear;
            qryAux.Sql.Add('SELECT');
            qryAux.Sql.Add('R.IDREPORTS, R.ORIGEMCM, M.NOMEMODULO,');
            qryAux.Sql.Add('DECODE(C.DESCRICAO,NULL,R.NAME,C.DESCRICAO) AS NAME,');
            qryAux.Sql.Add('G.DESCRICAO AS DESCRICAOGRUPOMESTRE,');
            qryAux.Sql.Add('G.IDGRUPORELATORIO,');
            qryAux.Sql.Add('G.IDGRUPOMESTRE,');
            qryAux.Sql.Add('CASE');
            qryAux.Sql.Add('  WHEN G.IDGRUPOMESTRE > 0 THEN');
            qryAux.Sql.Add('    (SELECT DESCRICAO FROM GRUPORELATORIO WHERE IDGRUPORELATORIO = G.IDGRUPOMESTRE AND ROWNUM = 1)');
            qryAux.Sql.Add('  ELSE');
            qryAux.Sql.Add('    G.DESCRICAO');
            qryAux.Sql.Add('END AS DESCRICAO,');
            qryAux.Sql.Add('R.FLGEXIBENOPREVIEW');
            qryAux.Sql.Add('FROM');
            qryAux.Sql.Add('  REPORTS R, MODULO M, GRUPORELATORIO G, CONFIGREPORTSCM C');
            qryAux.Sql.Add('WHERE');
            qryAux.Sql.Add('((R.IDMODULO = ' + IntToStr(IdModulo) + ') OR');
            if ExibeGlobal then begin
              qryAux.Sql.Add('    ((R.IDMODULO = 2 ) AND (R.IDDATAVIEW IS NOT NULL)))');
            end
            else begin
              qryAux.Sql.Add('    ((R.IDMODULO = ' + IntToStr(IdModulo) + ' ) AND (R.IDDATAVIEW IS NOT NULL)))');
            end;
            qryAux.Sql.Add('  AND (R.IDMODULO = M.IDMODULO)');
            qryAux.Sql.Add('  AND (R.IDGRUPORELATORIO = G.IDGRUPORELATORIO(+))');
            qryAux.Sql.Add('  AND (R.ORIGEMCMGR = G.ORIGEMCMGR(+))');
            qryAux.Sql.Add('  AND (R.IDREPORTS = C.IDREPORTS(+))');
            qryAux.Sql.Add('  AND (R.ORIGEMCM = C.ORIGEMCM(+))');
            qryAux.Sql.Add('  AND (C.IDPESSOA(+) = ' + FloatToStr(IdEmpresa) + ')');
            qryAux.Sql.Add('  AND (R.FLGTIPO IS NULL OR R.FLGTIPO = ' + QuotedStr('R') + ')');
            qryAux.Sql.Add('  AND (R.FLGRELATATIVO = ' + QuotedStr('S') + ')');
            qryAux.Sql.Add('  AND (M.NOMEMODULO = ' + QuotedStr(qryGrupos.FieldByName('NOMEMODULO').AsString) + ')');
            qryAux.Sql.Add('  AND (G.DESCRICAO  = ' + QuotedStr(qryGrupos.FieldByName('DESCRICAO').AsString) + ')');
            qryAux.Sql.Add('  AND G.IDGRUPOMESTRE = 0');
            //qryAux.Sql.Add('ORDER BY M.NOMEMODULO'); // SOL 143297.12044 Kintana 1832792
            qryAux.Sql.Add('ORDER BY M.NOMEMODULO, R.NAME'); // SOL 143297.12044 Kintana 1832792 //SOL 195642 Kintana 1869273

            try
              qryAux.Open;
            except
              qryAux.Close;
              FreeAndNil(qryAux);
              Exit;
            end;

            if not qryAux.IsEmpty then begin

              while not qryAux.Eof do begin
                // Re utilização de código anterior

                // Rodolpho da Silva - 01/11/2006
                // Insere o relatório na árvore, caso ele não esteja na lista de relatórios
                //a não serem exibidos
                if not TFrmCMPrincipalForms(Application.MainForm).ReportInvisible(qryAux.FieldByName('IDREPORTS').AsInteger) then
                begin
                  TreeFilho := TreeReports.Items.AddChild(TreeGrupo,qryAux.FieldByName('NAME').AsString);

                  If CdsAutorizaRpt.Locate('IDREPORTS;ORIGEMCM',VarArrayOf([qryAux.FieldByName('IdReports').AsFloat,qryAux.FieldByName('OrigemCm').AsFloat]),[]) Then
                  Begin
                    If ExibeCheck Then
                    Begin
                       TreeFilho.CheckboxType := tvctCheckBox;
                       TreeFilho.Checked := True;
                       TreeFilho.ImageIndex := 1;
                       TreeFilho.SelectedIndex := 1;
                    End
                    Else
                    Begin
                       TreeFilho.ImageIndex := 1;
                       TreeFilho.SelectedIndex := 2;
                    End;
                  End
                  Else
                  Begin
                    If ExibeCheck Then
                    Begin
                       TreeFilho.CheckboxType := tvctCheckBox;
                       TreeFilho.Checked := False;
                       TreeFilho.ImageIndex := 1;
                       TreeFilho.SelectedIndex := 1;
                    End
                    Else
                    Begin
                       TreeFilho.ImageIndex := 4;
                       TreeFilho.SelectedIndex := 4;
                    End;
                  End;

                  TreeFilho.StringData  := qryAux.FieldByName('IdReports').AsString;
                  TreeFilho.StringData2 := qryAux.FieldByName('OrigemCm').AsString;
                end;

{                InsereArvoreRecursiva(TreeReports, TreeGrupo, CdsReports, qryAux.FieldByName('IDGRUPORELATORIO').AsFloat,
                                      ExibeCheck, ExibeGlobal, bAddAllReports, IdEmpresa, IdUsuario, IdModulo, IdEspacesso);}
                qryAux.Next;
              end;
              InsereArvoreRecursiva(TreeReports, TreeGrupo, CdsReports, qryAux.FieldByName('IDGRUPORELATORIO').AsFloat,
                                    ExibeCheck, ExibeGlobal, bAddAllReports, IdEmpresa, IdUsuario, IdModulo, IdEspacesso);
            end;
            qryGrupos.Next;
          end;
        end;
      finally
        qryGrupos.Close;
        FreeAndNil(qryGrupos);
      end;
      qryGrupo.Next;
    end;
  finally
    qryGrupo.Close;
    FreeAndNil(qryGrupo);

    qryAux.Close;
    FreeAndNil(qryAux);
  end;
  // Thiago Melo SOL 143297 Kintana 928391

{
  // Código anterior

  While Not CdsReports.Eof Do
  Begin
     If bAddAllReports or (CdsReports.FieldByName('FLGEXIBENOPREVIEW').AsString <> 'N') Then
     Begin
        If SoldNome <> CdsReports.FieldByName('NOMEMODULO').AsString Then
        Begin
         TreePai := TreeReports.Items.Add(nil,CdsReports.FieldByName('NOMEMODULO').AsString);
         TreePai.ImageIndex := 0;
         TreePai.SelectedIndex := 0;
         TreePai.StringData := CdsReports.FieldByName('IdReports').AsString;
         TreePai.StringData2 := CdsReports.FieldByName('OrigemCm').AsString;

         sOldGrupo := '';
        End;
        If SoldGrupo <> CdsReports.FieldByName('DESCRICAO').AsString Then
        Begin
         TreeGrupo := TreeReports.Items.AddChild(TreePai,CdsReports.FieldByName('DESCRICAO').AsString);
         TreeGrupo.ImageIndex := 3;
         TreeGrupo.SelectedIndex := 3;
         TreeGrupo.StringData := CdsReports.FieldByName('IdReports').AsString;
         TreeGrupo.StringData2 := CdsReports.FieldByName('OrigemCm').AsString;
        End;

        // Rodolpho da Silva - 01/11/2006
        // Insere o relatório na árvore, caso ele não esteja na lista de relatórios
        //a não serem exibidos
        if not TFrmCMPrincipalForms(Application.MainForm).ReportInvisible(CdsReports.FieldByName('IDREPORTS').AsInteger) then
        begin
            TreeFilho := TreeReports.Items.AddChild(TreeGrupo,CdsReports.FieldByName('NAME').AsString);

            If CdsAutorizaRpt.Locate('IDREPORTS;ORIGEMCM',VarArrayOf([CdsReports.FieldByName('IdReports').AsFloat,CdsReports.FieldByName('OrigemCm').AsFloat]),[]) Then
            Begin
              If ExibeCheck Then
              Begin
                 TreeFilho.CheckboxType := tvctCheckBox;
                 TreeFilho.Checked := True;
                 TreeFilho.ImageIndex := 1;
                 TreeFilho.SelectedIndex := 1;
              End
              Else
              Begin
                 TreeFilho.ImageIndex := 1;
                 TreeFilho.SelectedIndex := 2;
              End;
            End
            Else
            Begin
              If ExibeCheck Then
              Begin
                 TreeFilho.CheckboxType := tvctCheckBox;
                 TreeFilho.Checked := False;
                 TreeFilho.ImageIndex := 1;
                 TreeFilho.SelectedIndex := 1;
              End
              Else
              Begin
                 TreeFilho.ImageIndex := 4;
                 TreeFilho.SelectedIndex := 4;
              End;
            End;

            TreeFilho.StringData := CdsReports.FieldByName('IdReports').AsString;
            TreeFilho.StringData2 := CdsReports.FieldByName('OrigemCm').AsString;
        end;

        SOldNome := CdsReports.FieldByName('NOMEMODULO').AsString;
        sOldGrupo := CdsReports.FieldByName('DESCRICAO').AsString;

     End;

     CdsReports.Next;
  End;}
// Thiago Melo SOL 143297 Kintana 928391
  CdsReports.Close;
  CdsAutorizaRpt.Close;
end;

procedure TdtmAutorizacao.MontaArvoreConsulta(TreeConsulta: TfcTreeView; IdEmpresa,
          IdUsuario, IdModulo, IdEspacesso:LongInt; ExibeCheck, ExibeGlobal: Boolean);
Var
    SOldNome, SOldGrupo: String;
    TreePai, TreeFilho, TreeGrupo: TfcTreeNode;
Begin
  With SQLAutorizaConsulta Do
  Begin
     Prepare;
     ParamByName('IDEMPRESA').AsFloat := IdEmpresa;
     ParamByName('IDUSUARIO').AsFloat := IdUsuario;
     ParamByName('IDMODULO').AsFloat := IdModulo;

     If ExibeGlobal Then
        ParamByName('IDMODULO2').AsFloat := 2
     Else
        ParamByName('IDMODULO2').AsFloat := IdModulo;

     ParamByName('IDESPACESSO').AsFloat := IdEspacesso;
     Open;
  End;

  With SqlConsulta Do
  Begin
     Prepare;
     ParamByName('IDMODULO').AsFloat := IdModulo;

     If ExibeGlobal Then
        ParamByName('IDMODULO2').AsFloat := 2
     Else
        ParamByName('IDMODULO2').AsFloat := IdModulo;

     Open;
  End;

  sOldNome := '';
  sOldGrupo := '';
  TreePai := nil;
  TreeGrupo := nil;

  TreeConsulta.Items.Clear;

  While Not CdsConsulta.Eof Do
  Begin
     If SoldNome <> CdsConsulta.FieldByName('NOMEMODULO').AsString Then
     Begin
      TreePai := TreeConsulta.Items.Add(nil,CdsConsulta.FieldByName('NOMEMODULO').AsString);
      TreePai.ImageIndex := 0;
      TreePai.SelectedIndex := 0;
      TreePai.StringData := CdsConsulta.FieldByName('IdMontaSelect').AsString;

      sOldGrupo := '';
     End;

     If SoldGrupo <> CdsConsulta.FieldByName('DESCRICAO').AsString Then
     Begin
      TreeGrupo := TreeConsulta.Items.AddChild(TreePai,CdsConsulta.FieldByName('DESCRICAO').AsString);
      TreeGrupo.ImageIndex := 3;
      TreeGrupo.SelectedIndex := 3;
      TreeGrupo.StringData := CdsConsulta.FieldByName('IdMontaSelect').AsString;
     End;

     TreeFilho := TreeConsulta.Items.AddChild(TreeGrupo,CdsConsulta.FieldByName('NAME').AsString);

     If CdsAutorizaConsulta.Locate('IDMONTASELECT',CdsConsulta.FieldByName('IDMONTASELECT').AsFloat,[]) Then
     Begin
       If ExibeCheck Then
       Begin
          TreeFilho.CheckboxType := tvctCheckBox;
          TreeFilho.Checked := True;
          TreeFilho.ImageIndex := 1;
          TreeFilho.SelectedIndex := 1;
       End
       Else
       Begin
          TreeFilho.ImageIndex := 1;
          TreeFilho.SelectedIndex := 2;
       End;
     End
     Else
     Begin
       If ExibeCheck Then
       Begin
          TreeFilho.CheckboxType := tvctCheckBox;
          TreeFilho.Checked := False;
          TreeFilho.ImageIndex := 1;
          TreeFilho.SelectedIndex := 1;
       End
       Else
       Begin
          TreeFilho.ImageIndex := 4;
          TreeFilho.SelectedIndex := 4;
       End;
     End;

     TreeFilho.StringData := CdsConsulta.FieldByName('IDMONTASELECT').AsString;

     SOldNome := CdsConsulta.FieldByName('NOMEMODULO').AsString;
     sOldGrupo := CdsConsulta.FieldByName('DESCRICAO').AsString;
     CdsConsulta.Next;
  End;
  CdsConsulta.Close;
  CdsAutorizaConsulta.Close;
end;

procedure TDtmAutorizacao.dsFluxOperDataChange(Sender: TObject;
  Field: TField);
begin
  SqlPasso.Prepare;
  SqlPasso.ParamByName('IDWORKFLOW').AsFloat := CdsFluxOper.FieldByName('IDWORKFLOW').AsFloat;
  SqlPasso.Open;
end;

// Thiago Melo SOL 143297 Kintana 928391
procedure TDtmAutorizacao.InsereArvoreRecursiva (TreeReports: TfcTreeView; Pai : TfcTreeNode; Cds : TClientDataSet;
                                                 idGrupoRelatorio : Double; ExibeCheck, ExibeGlobal, bAddAllReports: Boolean;
                                                 IdEmpresa, IdUsuario, IdModulo, IdEspacesso : LongInt);
var
  TreeFilho, TreeGrupo : TfcTreeNode;
  qryRecursiva : TwwQuery;
  DescricaoGrupoRelatorio : String;
begin
  qryRecursiva := TwwQuery.Create(Self);
  qryRecursiva.DataBaseName := 'BaseDados';
  try
    qryRecursiva.Close;
    qryRecursiva.Sql.Clear;
    qryRecursiva.Sql.Add('SELECT');
    qryRecursiva.Sql.Add('R.IDREPORTS, R.ORIGEMCM, M.NOMEMODULO,');
    qryRecursiva.Sql.Add('DECODE(C.DESCRICAO,NULL,R.NAME,C.DESCRICAO) AS NAME,');
    qryRecursiva.Sql.Add('G.DESCRICAO,');
    qryRecursiva.Sql.Add('G.IDGRUPORELATORIO,');
    qryRecursiva.Sql.Add('G.IDGRUPOMESTRE,');
    qryRecursiva.Sql.Add('R.FLGEXIBENOPREVIEW');
    qryRecursiva.Sql.Add('FROM');
    qryRecursiva.Sql.Add('  REPORTS R, MODULO M, GRUPORELATORIO G, CONFIGREPORTSCM C');
    qryRecursiva.Sql.Add('WHERE');
    qryRecursiva.Sql.Add('((R.IDMODULO = ' + IntToStr(IdModulo) + ') OR');
    if ExibeGlobal then begin
      qryRecursiva.Sql.Add('    ((R.IDMODULO = 2 ) AND (R.IDDATAVIEW IS NOT NULL)))');
    end
    else begin
      qryRecursiva.Sql.Add('    ((R.IDMODULO = ' + IntToStr(IdModulo) + ' ) AND (R.IDDATAVIEW IS NOT NULL)))');
    end;
    qryRecursiva.Sql.Add('  AND (R.IDMODULO = M.IDMODULO)');
    qryRecursiva.Sql.Add('  AND (R.IDGRUPORELATORIO = G.IDGRUPORELATORIO(+))');
    qryRecursiva.Sql.Add('  AND (R.ORIGEMCMGR = G.ORIGEMCMGR(+))');
    qryRecursiva.Sql.Add('  AND (R.IDREPORTS = C.IDREPORTS(+))');
    qryRecursiva.Sql.Add('  AND (R.ORIGEMCM = C.ORIGEMCM(+))');
    qryRecursiva.Sql.Add('  AND (C.IDPESSOA(+) = ' + FloatToStr(IdEmpresa) + ')');
    qryRecursiva.Sql.Add('  AND (R.FLGTIPO IS NULL OR R.FLGTIPO = ' + QuotedStr('R') + ')');
    qryRecursiva.Sql.Add('  AND (R.FLGRELATATIVO = ' + QuotedStr('S') + ')');
    qryRecursiva.Sql.Add('  AND  G.IDGRUPOMESTRE= ' + FloatToStr(idGrupoRelatorio));
    //qryRecursiva.Sql.Add('ORDER BY M.NOMEMODULO'); // SOL 143297.12044 Kintana 1832792
    qryRecursiva.Sql.Add('ORDER BY M.NOMEMODULO, R.NAME'); // SOL 143297.12044 Kintana 1832792 //SOL 195642 Kintana 1869273
    qryRecursiva.Open;

    if not qryRecursiva.IsEmpty then begin

      DescricaoGrupoRelatorio := '';

      while not qryRecursiva.Eof do begin
        if DescricaoGrupoRelatorio <> Trim(qryRecursiva.FieldByName('descricao').AsString) then begin
          TreeGrupo := TreeReports.Items.AddChild(Pai,qryRecursiva.FieldByName('descricao').AsString);
          TreeGrupo.ImageIndex := 3;
          TreeGrupo.SelectedIndex := 3;

          TreeGrupo.StringData  := qryRecursiva.FieldByName('IdReports').AsString;
          TreeGrupo.StringData2 := qryRecursiva.FieldByName('OrigemCm').AsString;
        end;

        DescricaoGrupoRelatorio := Trim(qryRecursiva.FieldByName('descricao').AsString);

        // Re utilização de código anterior

        // Rodolpho da Silva - 01/11/2006
        // Insere o relatório na árvore, caso ele não esteja na lista de relatórios
        //a não serem exibidos

        if not TFrmCMPrincipalForms(Application.MainForm).ReportInvisible(qryRecursiva.FieldByName('IDREPORTS').AsInteger) then
        begin
          TreeFilho := TreeReports.Items.AddChild(TreeGrupo,qryRecursiva.FieldByName('NAME').AsString);

          If CdsAutorizaRpt.Locate('IDREPORTS;ORIGEMCM',VarArrayOf([qryRecursiva.FieldByName('IdReports').AsFloat,qryRecursiva.FieldByName('OrigemCm').AsFloat]),[]) Then
          Begin
            If ExibeCheck Then
            Begin
               TreeFilho.CheckboxType := tvctCheckBox;
               TreeFilho.Checked := True;
               TreeFilho.ImageIndex := 1;
               TreeFilho.SelectedIndex := 1;
            End
            Else
            Begin
               TreeFilho.ImageIndex := 1;
               TreeFilho.SelectedIndex := 2;
            End;
          End
          Else
          Begin
            If ExibeCheck Then
            Begin
               TreeFilho.CheckboxType := tvctCheckBox;
               TreeFilho.Checked := False;
               TreeFilho.ImageIndex := 1;
               TreeFilho.SelectedIndex := 1;
            End
            Else
            Begin
               TreeFilho.ImageIndex := 4;
               TreeFilho.SelectedIndex := 4;
            End;
          End;

          TreeFilho.StringData  := qryRecursiva.FieldByName('IdReports').AsString;
          TreeFilho.StringData2 := qryRecursiva.FieldByName('OrigemCm').AsString;
        end;

        qryRecursiva.Next;
      end;
      InsereArvoreRecursiva(TreeReports, TreeGrupo, Cds, qryRecursiva.FieldByName('IDGRUPORELATORIO').AsFloat,
                            ExibeCheck, ExibeGlobal, bAddAllReports, IdEmpresa, IdUsuario, IdModulo, IdEspacesso);
    end;
  finally
    qryRecursiva.Close;
    FreeAndNil(qryRecursiva);
  end;
end;

end.
