unit uListaCamposHistAlmox;

interface

Uses Classes, uCtrlModeloHistorico;

const
   NUMERO_NOTA                          = 'Número da Nota';
   COMPLEMENTO_NOTA                     = 'Complemento da Nota';
   DESCRICAO_TIPO_DOCUMENTO             = 'Descrição do Tipo de Documento';
   RAZAO_SOCIAL_FORNECEDOR              = 'Razão Social do Fornecedor';
   NOME_FORNECEDOR                      = 'Nome do Fornecedor';
   NUMERO_SLIP                          = 'Número do Slip';
   DATA_VENCIMENTO                      = 'Data de Vencimento';
   DATA_EMISSAO                         = 'Data de Emissão';
   HISTORICO_COMPLEMENTAR               = 'Histórico Complementar';
   NUMERO_OC                            = 'Numero da OC';
   NUMERO_NOTA_DEVOL                    = 'Número da Nota de Devolução';
   COMPLEMENTO_NOTA_DEVOL               = 'Complemento da Nota de Devolução';
   NUMERO_NOTA_ENTRADA                  = 'Número da Nota de Entrada';
   COMPLEMENTO_NOTA_ENTRADA             = 'Complemento da Nota de Entrada';
   DESCRICAO_TIPO_DOCUMENTO_ENTRADA     = 'Descrição do Tipo de Documento de Entrada';
   NUMERO_NOTA_COMPL                    = 'Número da Nota Complementar';
   COMPLEMENTO_NOTA_COMPL               = 'Complemento da Nota Complementar';
   RAZAO_SOCIAL_FORNECEDOR_NOTA_COMPL   = 'Razão Social do Fornecedor da Nota Complementar';
   NOME_FORNECEDOR_NOTA_COMPL           = 'Nome do Fornecedor da Nota Complementar';
   RAZAO_SOCIAL_FORNECEDOR_NOTA_ENTRADA = 'Razão Social do Fornecedor da Nota de Entrada';
   NOME_FORNECEDOR_NOTA_ENTRADA         = 'Nome do Fornecedor da Nota de Entrada';
   DESCRICAO_AGREGADO                   = 'Descrição do Agregado';
   DESCRICAO_ALMOX_ORIGEM               = 'Descrição do Almoxarifado de Origem';
   DESCRICAO_ALMOX_DESTINO              = 'Descrição do Almoxarifado de Destino';
   DESCRICAO_CENTRO_CUSTO               = 'Descrição do Centro de Custo';
   CODIGO_CENTRO_CUSTO                  = 'Código do Centro de Custo';
   DESCRICAO_TIPO_PERDA                 = 'Descrição do Tipo de Perda';

Procedure SetListaCamposHistAlmox( Tipo : Integer; Lst : TStrings );

Function GetHistoricoAlmox( Obj         : TCtrlModeloHistorico;
                            IdPessoa    : Double;
                            IdModulo    : Integer;
                            Tipo        : Integer;
                            HistDefault : String;
                            Args        : Array of String ) : String;

implementation

Procedure SetListaCamposHistAlmox( Tipo : Integer; Lst : TStrings );
Begin
   Lst.Clear;

   Case Tipo Of
      0 : Begin //   Recebimento de Mercadoria
             Lst.Add( NUMERO_NOTA );
             Lst.Add( COMPLEMENTO_NOTA );
             Lst.Add( DESCRICAO_TIPO_DOCUMENTO );
             Lst.Add( RAZAO_SOCIAL_FORNECEDOR );
             Lst.Add( NOME_FORNECEDOR );
             Lst.Add( NUMERO_SLIP );
             Lst.Add( DATA_VENCIMENTO );
             Lst.Add( DATA_EMISSAO );
             Lst.Add( HISTORICO_COMPLEMENTAR );
             Lst.Add( NUMERO_OC );
          End;
      1 : Begin //Devolução de Mercadoria
             Lst.Add( NUMERO_NOTA_DEVOL );
             Lst.Add( COMPLEMENTO_NOTA_DEVOL );
             Lst.Add( NUMERO_NOTA_ENTRADA );
             Lst.Add( COMPLEMENTO_NOTA_ENTRADA );
             Lst.Add( DESCRICAO_TIPO_DOCUMENTO_ENTRADA );
             Lst.Add( RAZAO_SOCIAL_FORNECEDOR );
             Lst.Add( NOME_FORNECEDOR );
             Lst.Add( NUMERO_OC );
          End;
      2 : Begin //Nota Complementar
             Lst.Add( NUMERO_NOTA_COMPL );
             Lst.Add( COMPLEMENTO_NOTA_COMPL );
             Lst.Add( RAZAO_SOCIAL_FORNECEDOR_NOTA_COMPL );
             Lst.Add( NOME_FORNECEDOR_NOTA_COMPL );
             Lst.Add( NUMERO_NOTA_ENTRADA );
             Lst.Add( COMPLEMENTO_NOTA_ENTRADA );
             Lst.Add( RAZAO_SOCIAL_FORNECEDOR_NOTA_ENTRADA );
             Lst.Add( NOME_FORNECEDOR_NOTA_ENTRADA );
             Lst.Add( DESCRICAO_TIPO_DOCUMENTO_ENTRADA );
             Lst.Add( NUMERO_OC );
          End;
      3 : Begin //Custos Agregados
             Lst.Add( NUMERO_NOTA );
             Lst.Add( COMPLEMENTO_NOTA );
             Lst.Add( DESCRICAO_AGREGADO );
             Lst.Add( RAZAO_SOCIAL_FORNECEDOR );
             Lst.Add( NOME_FORNECEDOR );
             Lst.Add( NUMERO_SLIP );
          End;
      4 : Begin //Integração dos Custos Contábeis - Transferência
             Lst.Add( DESCRICAO_ALMOX_ORIGEM  );
             Lst.Add( DESCRICAO_ALMOX_DESTINO );
          End;
      5 : Begin //Integração dos Custos Contábeis - Custo
             Lst.Add( DESCRICAO_ALMOX_ORIGEM );
             Lst.Add( DESCRICAO_CENTRO_CUSTO );
             Lst.Add( CODIGO_CENTRO_CUSTO );
          End;
      6 : Begin //Integração dos Custos Contábeis - Baixa por Perda
             Lst.Add( DESCRICAO_ALMOX_ORIGEM );
             Lst.Add( DESCRICAO_CENTRO_CUSTO );
             Lst.Add( CODIGO_CENTRO_CUSTO );
             Lst.Add( DESCRICAO_TIPO_PERDA );
          End;
   End;

End;

Function GetHistoricoAlmox( Obj         : TCtrlModeloHistorico;
                            IdPessoa    : Double;
                            IdModulo    : Integer;
                            Tipo        : Integer;
                            HistDefault : String;
                            Args        : Array of String ) : String;
Var
   x : Integer;
begin
   //Pega a lista de Campos referente ao tipo de Modelo
   SetListaCamposHistAlmox( Tipo, Obj.FieldNames );

   //Prenche os valores referente aos campos da lista
   Obj.FieldValues.Clear;

   For x:= 0 To High( Args ) Do
       Obj.FieldValues.add( Args[x] );

   Result := Obj.GetHistorico(Trunc(IdPessoa),IdModulo,Tipo,HistDefault);
End;

end.
