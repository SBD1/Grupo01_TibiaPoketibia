PGDMP                         z            tibia    14.5    14.5 �    W           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            X           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            Y           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            Z           1262    16394    tibia    DATABASE     e   CREATE DATABASE tibia WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE tibia;
                postgres    false                        2615    16835    replays    SCHEMA        CREATE SCHEMA replays;
    DROP SCHEMA replays;
                postgres    false            o           1247    16396    pch    DOMAIN     �   CREATE DOMAIN public.pch AS character varying(7)
	CONSTRAINT pch_check CHECK (((VALUE)::text = ANY (ARRAY[('corpo'::character varying)::text, ('cabeca'::character varying)::text, ('pernas'::character varying)::text, ('pes'::character varying)::text])));
    DROP DOMAIN public.pch;
       public          postgres    false            s           1247    16399    tipocriatura    DOMAIN     O  CREATE DOMAIN public.tipocriatura AS character varying(20)
	CONSTRAINT tipocriatura_check CHECK (((VALUE)::text = ANY (ARRAY[('anfibios'::character varying)::text, ('aquaticos'::character varying)::text, ('aves'::character varying)::text, ('bosses'::character varying)::text, ('constructos'::character varying)::text, ('criaturas_magicas'::character varying)::text, ('demonios'::character varying)::text, ('dragoes'::character varying)::text, ('elementais'::character varying)::text, ('extra_dimensionais'::character varying)::text, ('fadas'::character varying)::text, ('gigantes'::character varying)::text, ('humanos'::character varying)::text, ('humanoides'::character varying)::text, ('imortais'::character varying)::text, ('licantropos'::character varying)::text, ('mamiferos'::character varying)::text, ('mortos-vivos'::character varying)::text, ('plantas'::character varying)::text, ('repteis'::character varying)::text, ('slimes'::character varying)::text, ('the_ruthless_seven'::character varying)::text, ('triangle_of_terror'::character varying)::text, ('vermes'::character varying)::text])));
 !   DROP DOMAIN public.tipocriatura;
       public          postgres    false            w           1247    16402    tipoitem    DOMAIN     6  CREATE DOMAIN public.tipoitem AS character varying(12)
	CONSTRAINT tipoitem_check CHECK (((VALUE)::text = ANY (ARRAY[('armas'::character varying)::text, ('equipamento'::character varying)::text, ('mochila'::character varying)::text, ('riqueza'::character varying)::text, ('none'::character varying)::text])));
    DROP DOMAIN public.tipoitem;
       public          postgres    false            {           1247    16405    tiponpc    DOMAIN     �   CREATE DOMAIN public.tiponpc AS character varying(12)
	CONSTRAINT tiponpc_check CHECK (((VALUE)::text = ANY (ARRAY[('comerciante'::character varying)::text, ('guia'::character varying)::text])));
    DROP DOMAIN public.tiponpc;
       public          postgres    false                       1247    16408    tipopersonagem    DOMAIN     �   CREATE DOMAIN public.tipopersonagem AS character(8)
	CONSTRAINT tipopersonagem_check CHECK ((VALUE = ANY (ARRAY['player'::bpchar, 'criatura'::bpchar, 'npc'::bpchar])));
 #   DROP DOMAIN public.tipopersonagem;
       public          postgres    false            �           1247    16411    vocacao    DOMAIN     7  CREATE DOMAIN public.vocacao AS character varying(12)
	CONSTRAINT vocacao_check CHECK (((VALUE)::text = ANY (ARRAY[('cavaleiro'::character varying)::text, ('feiticeiro'::character varying)::text, ('paladino'::character varying)::text, ('druida'::character varying)::text, ('none'::character varying)::text])));
    DROP DOMAIN public.vocacao;
       public          postgres    false                       1255    18431 )   check_backpack_has_item(integer, integer)    FUNCTION     #  CREATE FUNCTION public.check_backpack_has_item(_id_player integer, _id_instancia_item integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN (SELECT count(*) FROM inventario_guarda_instancia_item WHERE id_instancia_item=_id_instancia_item and id_player=_id_player);
END;
$$;
 ^   DROP FUNCTION public.check_backpack_has_item(_id_player integer, _id_instancia_item integer);
       public          postgres    false                       1255    18430    check_item_exists(integer)    FUNCTION     �   CREATE FUNCTION public.check_item_exists(_id_instancia_item integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN (SELECT count(*) FROM instancia_item WHERE id = _id_instancia_item);
END;
$$;
 D   DROP FUNCTION public.check_item_exists(_id_instancia_item integer);
       public          postgres    false            
           1255    16883    get_conta_idade(integer)    FUNCTION       CREATE FUNCTION public.get_conta_idade(_id_conta integer) RETURNS smallint
    LANGUAGE plpgsql
    AS $$  
DECLARE
	_idade SMALLINT;
BEGIN
  _idade := (SELECT EXTRACT(year FROM age(current_date, data_de_aniversario)) FROM conta WHERE id=_id_conta);
  RETURN _idade;
END;
$$;
 9   DROP FUNCTION public.get_conta_idade(_id_conta integer);
       public          postgres    false                       1255    16931    get_id_item(integer)    FUNCTION     �   CREATE FUNCTION public.get_id_item(_id_instancia integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
	DECLARE
  	_id_item INTEGER;
BEGIN
	_id_item := (SELECT id_item FROM instancia_item WHERE id=_id_instancia);
	RETURN _id_item;
END;
$$;
 9   DROP FUNCTION public.get_id_item(_id_instancia integer);
       public          postgres    false                       1255    18429 '   get_item_on_the_floor(integer, integer) 	   PROCEDURE     o  CREATE PROCEDURE public.get_item_on_the_floor(IN _id_instancia_item integer, IN _id_player integer)
    LANGUAGE plpgsql
    AS $$
  BEGIN
    DELETE FROM instancia_item_posicao
    WHERE id_instancia_item = _id_instancia_item;

    INSERT INTO inventario_guarda_instancia_item (id_player, id_instancia_item)
    VALUES  (_id_player, _id_instancia_item);

  END;
$$;
 c   DROP PROCEDURE public.get_item_on_the_floor(IN _id_instancia_item integer, IN _id_player integer);
       public          postgres    false                       1255    16926    get_player_level(integer)    FUNCTION       CREATE FUNCTION public.get_player_level(_id_player integer) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
    DECLARE
        xp_player BIGINT;
BEGIN
	SELECT experiencia INTO xp_player FROM player WHERE id=_id_player;
  	RETURN ((xp_player) / 1000) + 1;
END;
$$;
 ;   DROP FUNCTION public.get_player_level(_id_player integer);
       public          postgres    false                       1255    16932    get_player_position(integer)    FUNCTION     F  CREATE FUNCTION public.get_player_position(_id_player integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
  DECLARE 
  	_id_posicao INTEGER;
BEGIN
	_id_posicao := (SELECT id_localizacao FROM personagem INNER JOIN player ON player.idpersonagem = personagem.id WHERE player.id = _id_player);
  	RETURN _id_posicao;
END;
$$;
 >   DROP FUNCTION public.get_player_position(_id_player integer);
       public          postgres    false                       1255    16935    get_preco_item(integer)    FUNCTION     -  CREATE FUNCTION public.get_preco_item(_id_item integer) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
  DECLARE
  	_preco_item BIGINT;
BEGIN
  	_preco_item := (SELECT COALESCE(armas.preco, equipamento.preco, mochila.preco)  FROM item 
					FULL OUTER JOIN armas ON item.id = armas.id
					FULL OUTER JOIN equipamento ON item.id = equipamento.id
					FULL OUTER JOIN mochila ON item.id = mochila.id 
					WHERE item.id = _id_item);
	IF _preco_item = null THEN
		RAISE EXCEPTION 'Esse item não possui preço.';
	ELSE
		RETURN _preco_item;
	END IF;
END;	
$$;
 7   DROP FUNCTION public.get_preco_item(_id_item integer);
       public          postgres    false            �            1255    16934    get_tipo_item(integer)    FUNCTION     �   CREATE FUNCTION public.get_tipo_item(_id_item integer) RETURNS public.tipoitem
    LANGUAGE plpgsql
    AS $$
  DECLARE
  	_tipo_item tipoitem;
BEGIN
	_tipo_item := (SELECT tipo FROM item WHERE item.id = _id_item);
  	RETURN _tipo_item;
END;
$$;
 6   DROP FUNCTION public.get_tipo_item(_id_item integer);
       public          postgres    false    887                       1255    16929 %   valid_region_change(integer, integer)    FUNCTION     !  CREATE FUNCTION public.valid_region_change(_id_posicao integer, _id_player integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
  _permitido BOOLEAN;
  _vip_check BOOLEAN;
  _id_conta INTEGER;
  _vip_dias SMALLINT;
  
BEGIN
	_vip_check := (SELECT vip_check FROM regiao INNER JOIN localizacao ON regiao.id = localizacao.id_regiao WHERE localizacao.id = _id_posicao);
	_id_conta := (SELECT id_conta FROM conta INNER JOIN player ON player.id_conta = conta.id WHERE player.id = _id_player);
	IF _vip_check = FALSE THEN
		_permitido := TRUE;
	ELSE 
		_vip_dias := (SELECT vip_dias FROM conta INNER JOIN player ON player.id_conta = conta.id WHERE player.id = _id_player);
		IF _vip_dias > 0 THEN
			_permitido = TRUE;
		ELSE
			_permitido = FALSE;
		END IF;
	END IF;
	RETURN _permitido;
END;
$$;
 S   DROP FUNCTION public.valid_region_change(_id_posicao integer, _id_player integer);
       public          postgres    false                       1255    18401 %   vende_item(integer, integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.vende_item(IN _id_instancia_item integer, IN _id_player integer, IN _id_npc integer)
    LANGUAGE plpgsql
    AS $$
	DECLARE
		_id_item INTEGER;
		_preco_item BIGINT DEFAULT 0;
  BEGIN
		_id_item = get_id_item(_id_instancia_item);
		_preco_item = get_preco_item(_id_item);

    INSERT INTO vende (id_player, id_instancia_item, id_npc) VALUES
    (_id_player, _id_instancia_item, _id_npc);

    INSERT INTO inventario_guarda_instancia_item (id_player, id_instancia_item) VALUES
    (_id_player, _id_instancia_item);

    UPDATE inventario
      SET riqueza = riqueza - _preco_item
      WHERE id_player = _id_player;

    DELETE FROM npc_carrega_instancia_item
      WHERE id_instancia_item = _id_instancia_item;
	END;
$$;
 l   DROP PROCEDURE public.vende_item(IN _id_instancia_item integer, IN _id_player integer, IN _id_npc integer);
       public          postgres    false                       1255    18434    verificar_id_npc_vendedor()    FUNCTION     �  CREATE FUNCTION public.verificar_id_npc_vendedor() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    DECLARE
        _tipo_npc tiponpc;
    BEGIN
        SELECT tipo INTO _tipo_npc FROM npc WHERE id = NEW.id_npc;
        IF LOWER(_tipo_npc) <> 'comerciante' THEN
            RAISE EXCEPTION 'Somente NPCs comerciantes podem vender ou carregar itens.';
        END IF;
        RETURN NEW;
    END;
$$;
 2   DROP FUNCTION public.verificar_id_npc_vendedor();
       public          postgres    false                       1255    16921    verificar_limite_inventario()    FUNCTION     �  CREATE FUNCTION public.verificar_limite_inventario() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    DECLARE
        capacidade_inventario INTEGER;
		peso_item_atual INTEGER;
        soma_peso_itens INTEGER;
    BEGIN
        SELECT capacidade INTO capacidade_inventario FROM inventario WHERE id_player = NEW.id_player;
		
        SELECT (COALESCE(soma_tot.peso_armas, 0) + COALESCE(soma_tot.peso_equip, 0) + COALESCE(soma_tot.peso_mochila, 0) + COALESCE(soma_tot.peso_riqueza, 0))
			INTO soma_peso_itens FROM(
				SELECT SUM(armas.peso) as peso_armas, SUM(equipamento.peso) as peso_equip, SUM(mochila.peso) as peso_mochila, SUM(riqueza.peso) as peso_riqueza 
					FROM inventario_guarda_instancia_item 
						LEFT JOIN instancia_item ON instancia_item.id = inventario_guarda_instancia_item.id_instancia_item 
						LEFT JOIN armas ON armas.id = instancia_item.id_item 
						LEFT JOIN equipamento ON equipamento.id = instancia_item.id_item 
						LEFT JOIN mochila ON mochila.id = instancia_item.id_item
						LEFT JOIN riqueza ON riqueza.id = instancia_item.id_item) 
					as soma_tot;
					
		SELECT (COALESCE(armas.peso, 0) + COALESCE(equipamento.peso, 0) + COALESCE(mochila.peso, 0) + COALESCE(riqueza.peso, 0)) INTO peso_item_atual FROM instancia_item
			LEFT JOIN armas ON armas.id = instancia_item.id_item 
			LEFT JOIN equipamento ON equipamento.id = instancia_item.id_item 
			LEFT JOIN mochila ON mochila.id = instancia_item.id_item
			LEFT JOIN riqueza ON riqueza.id = instancia_item.id_item
		WHERE instancia_item.id = NEW.id_instancia_item;
		
		--RAISE NOTICE 'Capacidade utilizada := %', soma_peso_itens;
		--RAISE NOTICE 'Capacidade do inventario := %', capacidade_inventario;
		--RAISE NOTICE 'Peso do item a ser inserido := %', peso_item_atual;
        IF soma_peso_itens + peso_item_atual > capacidade_inventario THEN
            RAISE EXCEPTION 'Peso máximo do inventário alcançado. Não é possível adicionar mais items.';
        END IF;
        RETURN NEW;
    END;
$$;
 4   DROP FUNCTION public.verificar_limite_inventario();
       public          postgres    false            �            1259    16413    armas    TABLE     -  CREATE TABLE public.armas (
    id integer NOT NULL,
    nome character(50),
    ataque integer NOT NULL,
    defesa integer NOT NULL,
    vocacao public.vocacao NOT NULL,
    min_level smallint NOT NULL,
    bonus smallint NOT NULL,
    descricao text,
    peso numeric NOT NULL,
    preco bigint
);
    DROP TABLE public.armas;
       public         heap    postgres    false    899            �            1259    16421    batalha_id_batalha_seq    SEQUENCE     �   CREATE SEQUENCE public.batalha_id_batalha_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.batalha_id_batalha_seq;
       public          postgres    false            �            1259    16418    batalha    TABLE     �   CREATE TABLE public.batalha (
    id integer DEFAULT nextval('public.batalha_id_batalha_seq'::regclass) NOT NULL,
    tipo character(6) NOT NULL
);
    DROP TABLE public.batalha;
       public         heap    postgres    false    212            �            1259    16422    batalha_pvc_cm    TABLE     �   CREATE TABLE public.batalha_pvc_cm (
    id_batalha integer NOT NULL,
    id_player_morto integer NOT NULL,
    id_instancia_criatura integer NOT NULL
);
 "   DROP TABLE public.batalha_pvc_cm;
       public         heap    postgres    false            �            1259    16425    batalha_pvc_sm    TABLE     �   CREATE TABLE public.batalha_pvc_sm (
    id_batalha integer NOT NULL,
    id_player integer NOT NULL,
    id_instancia_criatura integer NOT NULL
);
 "   DROP TABLE public.batalha_pvc_sm;
       public         heap    postgres    false            �            1259    16428    batalha_pvp_cm    TABLE     �   CREATE TABLE public.batalha_pvp_cm (
    id_batalha integer NOT NULL,
    id_player_morto integer NOT NULL,
    id_player_vivo integer NOT NULL
);
 "   DROP TABLE public.batalha_pvp_cm;
       public         heap    postgres    false            �            1259    16431    batalha_pvp_sm    TABLE     �   CREATE TABLE public.batalha_pvp_sm (
    id_batalha integer NOT NULL,
    id_player_um integer NOT NULL,
    id_player_dois integer NOT NULL
);
 "   DROP TABLE public.batalha_pvp_sm;
       public         heap    postgres    false            �            1259    16438    conta_id_conta_seq    SEQUENCE     �   CREATE SEQUENCE public.conta_id_conta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.conta_id_conta_seq;
       public          postgres    false            �            1259    16434    conta    TABLE     �  CREATE TABLE public.conta (
    email character varying(320) NOT NULL,
    senha character(31) NOT NULL,
    nome character(50) NOT NULL,
    data_de_criacao timestamp with time zone,
    data_de_aniversario date NOT NULL,
    genero character(10) NOT NULL,
    localidade character(50) NOT NULL,
    idade smallint,
    banimento boolean DEFAULT false NOT NULL,
    vip_dias smallint NOT NULL,
    id integer DEFAULT nextval('public.conta_id_conta_seq'::regclass) NOT NULL
);
    DROP TABLE public.conta;
       public         heap    postgres    false    218            �            1259    16439    criatura    TABLE       CREATE TABLE public.criatura (
    id integer NOT NULL,
    nome character(50) NOT NULL,
    ataque integer NOT NULL,
    vida integer NOT NULL,
    experiencia integer NOT NULL,
    defesa integer NOT NULL,
    tipo public.tipocriatura NOT NULL,
    id_localizacao integer NOT NULL
);
    DROP TABLE public.criatura;
       public         heap    postgres    false    883            �            1259    16444    criatura_id_seq    SEQUENCE     �   CREATE SEQUENCE public.criatura_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.criatura_id_seq;
       public          postgres    false    219            [           0    0    criatura_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.criatura_id_seq OWNED BY public.criatura.id;
          public          postgres    false    220            �            1259    16445    equipamento    TABLE     3  CREATE TABLE public.equipamento (
    id integer NOT NULL,
    nome character(50),
    vocacao public.vocacao NOT NULL,
    min_level smallint NOT NULL,
    bonus smallint NOT NULL,
    descricao text,
    defesa integer NOT NULL,
    pch public.pch NOT NULL,
    peso numeric NOT NULL,
    preco bigint
);
    DROP TABLE public.equipamento;
       public         heap    postgres    false    899    879            �            1259    16450    guilda    TABLE     �   CREATE TABLE public.guilda (
    id integer NOT NULL,
    nome character(32) NOT NULL,
    descricao text,
    capacidade smallint DEFAULT 50 NOT NULL,
    data_de_criacao timestamp with time zone NOT NULL,
    id_dono integer NOT NULL
);
    DROP TABLE public.guilda;
       public         heap    postgres    false            �            1259    16456    guilda_id_seq    SEQUENCE     �   CREATE SEQUENCE public.guilda_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.guilda_id_seq;
       public          postgres    false    222            \           0    0    guilda_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.guilda_id_seq OWNED BY public.guilda.id;
          public          postgres    false    223            �            1259    16457    habilidades    TABLE        CREATE TABLE public.habilidades (
    velocidade smallint DEFAULT 110 NOT NULL,
    dano_a_distancia integer NOT NULL,
    dano_de_combate integer NOT NULL,
    capacidade integer NOT NULL,
    defesa_total integer NOT NULL,
    nivel_magia integer NOT NULL,
    nivel_espada integer NOT NULL,
    nivel_machado integer NOT NULL,
    nivel_defesa integer NOT NULL,
    nivel_punhos integer NOT NULL,
    nivel_porrete integer NOT NULL,
    nivel_armas_de_dist integer NOT NULL,
    id_player integer NOT NULL
);
    DROP TABLE public.habilidades;
       public         heap    postgres    false            �            1259    17594    habilidades_id_player_seq    SEQUENCE     �   CREATE SEQUENCE public.habilidades_id_player_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.habilidades_id_player_seq;
       public          postgres    false    224            ]           0    0    habilidades_id_player_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.habilidades_id_player_seq OWNED BY public.habilidades.id_player;
          public          postgres    false    252            �            1259    16461 	   historico    TABLE     �   CREATE TABLE public.historico (
    level smallint NOT NULL,
    dia_hora timestamp with time zone NOT NULL,
    ultimo_dano character(32),
    id_player_morto integer NOT NULL
);
    DROP TABLE public.historico;
       public         heap    postgres    false            �            1259    16473    instancia_criatura_id_seq    SEQUENCE     �   CREATE SEQUENCE public.instancia_criatura_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.instancia_criatura_id_seq;
       public          postgres    false            �            1259    16464    instancia_criatura    TABLE     �   CREATE TABLE public.instancia_criatura (
    id integer DEFAULT nextval('public.instancia_criatura_id_seq'::regclass) NOT NULL,
    id_criatura integer NOT NULL
);
 &   DROP TABLE public.instancia_criatura;
       public         heap    postgres    false    229            �            1259    16467 )   instancia_criatura_carrega_instancia_item    TABLE     �   CREATE TABLE public.instancia_criatura_carrega_instancia_item (
    id_instancia_criatura integer NOT NULL,
    id_instancia_item integer NOT NULL
);
 =   DROP TABLE public.instancia_criatura_carrega_instancia_item;
       public         heap    postgres    false            �            1259    16474    instancia_item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.instancia_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.instancia_item_id_seq;
       public          postgres    false            �            1259    16470    instancia_item    TABLE     �   CREATE TABLE public.instancia_item (
    id integer DEFAULT nextval('public.instancia_item_id_seq'::regclass) NOT NULL,
    id_item integer NOT NULL
);
 "   DROP TABLE public.instancia_item;
       public         heap    postgres    false    230            �            1259    18414    instancia_item_posicao    TABLE     |   CREATE TABLE public.instancia_item_posicao (
    id_instancia_item integer NOT NULL,
    id_localizacao integer NOT NULL
);
 *   DROP TABLE public.instancia_item_posicao;
       public         heap    postgres    false            �            1259    16475 
   inventario    TABLE     T  CREATE TABLE public.inventario (
    look_corpo integer,
    look_cabeca integer,
    look_pernas integer,
    look_pes integer,
    look_costas integer,
    mao_dir integer,
    mao_esq integer,
    fonte_de_luz integer,
    capacidade integer DEFAULT 410 NOT NULL,
    id_player integer NOT NULL,
    riqueza bigint DEFAULT 0 NOT NULL
);
    DROP TABLE public.inventario;
       public         heap    postgres    false            �            1259    16479     inventario_guarda_instancia_item    TABLE     �   CREATE TABLE public.inventario_guarda_instancia_item (
    id_instancia_item integer NOT NULL,
    id_player integer NOT NULL
);
 4   DROP TABLE public.inventario_guarda_instancia_item;
       public         heap    postgres    false            �            1259    16482    item    TABLE     {   CREATE TABLE public.item (
    id integer NOT NULL,
    tipo public.tipoitem DEFAULT 'none'::character varying NOT NULL
);
    DROP TABLE public.item;
       public         heap    postgres    false    887    887            �            1259    16488    item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.item_id_seq;
       public          postgres    false    233            ^           0    0    item_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.item_id_seq OWNED BY public.item.id;
          public          postgres    false    234            �            1259    16489    localizacao    TABLE     �   CREATE TABLE public.localizacao (
    id integer NOT NULL,
    posicao_x numeric DEFAULT 0 NOT NULL,
    posicao_y numeric DEFAULT 0 NOT NULL,
    posicao_z numeric DEFAULT 0 NOT NULL,
    id_regiao integer NOT NULL
);
    DROP TABLE public.localizacao;
       public         heap    postgres    false            �            1259    16497    localizacao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.localizacao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.localizacao_id_seq;
       public          postgres    false    235            _           0    0    localizacao_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.localizacao_id_seq OWNED BY public.localizacao.id;
          public          postgres    false    236            �            1259    16498    mapa    TABLE     W   CREATE TABLE public.mapa (
    id integer NOT NULL,
    nome character(15) NOT NULL
);
    DROP TABLE public.mapa;
       public         heap    postgres    false            �            1259    16501    mapa_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mapa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.mapa_id_seq;
       public          postgres    false    237            `           0    0    mapa_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.mapa_id_seq OWNED BY public.mapa.id;
          public          postgres    false    238            �            1259    16502    mochila    TABLE     �   CREATE TABLE public.mochila (
    id integer NOT NULL,
    nome character(50) NOT NULL,
    capacidade smallint NOT NULL,
    min_level smallint NOT NULL,
    descricao text,
    peso numeric NOT NULL,
    preco bigint
);
    DROP TABLE public.mochila;
       public         heap    postgres    false            �            1259    16507    npc    TABLE     �   CREATE TABLE public.npc (
    id integer NOT NULL,
    nome character(50) NOT NULL,
    tipo public.tiponpc NOT NULL,
    id_localizacao integer NOT NULL
);
    DROP TABLE public.npc;
       public         heap    postgres    false    891            �            1259    16512    npc_carrega_instancia_item    TABLE     x   CREATE TABLE public.npc_carrega_instancia_item (
    id_npc integer NOT NULL,
    id_instancia_item integer NOT NULL
);
 .   DROP TABLE public.npc_carrega_instancia_item;
       public         heap    postgres    false            �            1259    16515 
   npc_id_seq    SEQUENCE     �   CREATE SEQUENCE public.npc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.npc_id_seq;
       public          postgres    false    240            a           0    0 
   npc_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.npc_id_seq OWNED BY public.npc.id;
          public          postgres    false    242            �            1259    16516 
   personagem    TABLE     e   CREATE TABLE public.personagem (
    id integer NOT NULL,
    tipo public.tipopersonagem NOT NULL
);
    DROP TABLE public.personagem;
       public         heap    postgres    false    895            �            1259    16521    personagem_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personagem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.personagem_id_seq;
       public          postgres    false    243            b           0    0    personagem_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.personagem_id_seq OWNED BY public.personagem.id;
          public          postgres    false    244            �            1259    16522    player    TABLE     D  CREATE TABLE public.player (
    nome character(32) NOT NULL,
    vocacao public.vocacao DEFAULT 'none'::character varying NOT NULL,
    vida_maxima integer DEFAULT 155 NOT NULL,
    vida_atual integer DEFAULT 155 NOT NULL,
    mana_maxima integer DEFAULT 60 NOT NULL,
    mana_atual integer DEFAULT 60 NOT NULL,
    genero character(10) NOT NULL,
    experiencia bigint DEFAULT 0 NOT NULL,
    level smallint DEFAULT 0 NOT NULL,
    id integer NOT NULL,
    data_de_criacao timestamp with time zone NOT NULL,
    id_conta integer NOT NULL,
    id_localizacao integer NOT NULL
);
    DROP TABLE public.player;
       public         heap    postgres    false    899    899            �            1259    16534    player_id_seq    SEQUENCE     �   CREATE SEQUENCE public.player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.player_id_seq;
       public          postgres    false    245            c           0    0    player_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.player_id_seq OWNED BY public.player.id;
          public          postgres    false    246            �            1259    16848    players_guilda    TABLE     g   CREATE TABLE public.players_guilda (
    id_guilda integer NOT NULL,
    id_player integer NOT NULL
);
 "   DROP TABLE public.players_guilda;
       public         heap    postgres    false            �            1259    16535    regiao    TABLE     �   CREATE TABLE public.regiao (
    id integer NOT NULL,
    vip_check boolean DEFAULT false NOT NULL,
    id_mapa integer NOT NULL,
    nome character(32) NOT NULL
);
    DROP TABLE public.regiao;
       public         heap    postgres    false            �            1259    16539    regiao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.regiao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.regiao_id_seq;
       public          postgres    false    247            d           0    0    regiao_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.regiao_id_seq OWNED BY public.regiao.id;
          public          postgres    false    248            �            1259    16540    riqueza    TABLE     �   CREATE TABLE public.riqueza (
    id integer NOT NULL,
    nome character(50),
    valor bigint NOT NULL,
    min_level smallint NOT NULL,
    descricao text,
    peso numeric NOT NULL
);
    DROP TABLE public.riqueza;
       public         heap    postgres    false            �            1259    16545    vende    TABLE     �   CREATE TABLE public.vende (
    id_npc integer NOT NULL,
    id_instancia_item integer NOT NULL,
    id_player integer NOT NULL
);
    DROP TABLE public.vende;
       public         heap    postgres    false                       2604    16551 	   guilda id    DEFAULT     f   ALTER TABLE ONLY public.guilda ALTER COLUMN id SET DEFAULT nextval('public.guilda_id_seq'::regclass);
 8   ALTER TABLE public.guilda ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222                       2604    16554    item id    DEFAULT     b   ALTER TABLE ONLY public.item ALTER COLUMN id SET DEFAULT nextval('public.item_id_seq'::regclass);
 6   ALTER TABLE public.item ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    233                       2604    16555    localizacao id    DEFAULT     p   ALTER TABLE ONLY public.localizacao ALTER COLUMN id SET DEFAULT nextval('public.localizacao_id_seq'::regclass);
 =   ALTER TABLE public.localizacao ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    235                       2604    16556    mapa id    DEFAULT     b   ALTER TABLE ONLY public.mapa ALTER COLUMN id SET DEFAULT nextval('public.mapa_id_seq'::regclass);
 6   ALTER TABLE public.mapa ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    237                       2604    16558    personagem id    DEFAULT     n   ALTER TABLE ONLY public.personagem ALTER COLUMN id SET DEFAULT nextval('public.personagem_id_seq'::regclass);
 <   ALTER TABLE public.personagem ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    243                       2604    16560 	   regiao id    DEFAULT     f   ALTER TABLE ONLY public.regiao ALTER COLUMN id SET DEFAULT nextval('public.regiao_id_seq'::regclass);
 8   ALTER TABLE public.regiao ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    248    247            )          0    16413    armas 
   TABLE DATA           l   COPY public.armas (id, nome, ataque, defesa, vocacao, min_level, bonus, descricao, peso, preco) FROM stdin;
    public          postgres    false    210   �.      *          0    16418    batalha 
   TABLE DATA           +   COPY public.batalha (id, tipo) FROM stdin;
    public          postgres    false    211   E0      ,          0    16422    batalha_pvc_cm 
   TABLE DATA           \   COPY public.batalha_pvc_cm (id_batalha, id_player_morto, id_instancia_criatura) FROM stdin;
    public          postgres    false    213   b0      -          0    16425    batalha_pvc_sm 
   TABLE DATA           V   COPY public.batalha_pvc_sm (id_batalha, id_player, id_instancia_criatura) FROM stdin;
    public          postgres    false    214   0      .          0    16428    batalha_pvp_cm 
   TABLE DATA           U   COPY public.batalha_pvp_cm (id_batalha, id_player_morto, id_player_vivo) FROM stdin;
    public          postgres    false    215   �0      /          0    16431    batalha_pvp_sm 
   TABLE DATA           R   COPY public.batalha_pvp_sm (id_batalha, id_player_um, id_player_dois) FROM stdin;
    public          postgres    false    216   �0      0          0    16434    conta 
   TABLE DATA           �   COPY public.conta (email, senha, nome, data_de_criacao, data_de_aniversario, genero, localidade, idade, banimento, vip_dias, id) FROM stdin;
    public          postgres    false    217   �0      2          0    16439    criatura 
   TABLE DATA           e   COPY public.criatura (id, nome, ataque, vida, experiencia, defesa, tipo, id_localizacao) FROM stdin;
    public          postgres    false    219   ,2      4          0    16445    equipamento 
   TABLE DATA           o   COPY public.equipamento (id, nome, vocacao, min_level, bonus, descricao, defesa, pch, peso, preco) FROM stdin;
    public          postgres    false    221   y3      5          0    16450    guilda 
   TABLE DATA           [   COPY public.guilda (id, nome, descricao, capacidade, data_de_criacao, id_dono) FROM stdin;
    public          postgres    false    222   �5      7          0    16457    habilidades 
   TABLE DATA           �   COPY public.habilidades (velocidade, dano_a_distancia, dano_de_combate, capacidade, defesa_total, nivel_magia, nivel_espada, nivel_machado, nivel_defesa, nivel_punhos, nivel_porrete, nivel_armas_de_dist, id_player) FROM stdin;
    public          postgres    false    224   �5      8          0    16461 	   historico 
   TABLE DATA           R   COPY public.historico (level, dia_hora, ultimo_dano, id_player_morto) FROM stdin;
    public          postgres    false    225   �5      9          0    16464    instancia_criatura 
   TABLE DATA           =   COPY public.instancia_criatura (id, id_criatura) FROM stdin;
    public          postgres    false    226   �5      :          0    16467 )   instancia_criatura_carrega_instancia_item 
   TABLE DATA           m   COPY public.instancia_criatura_carrega_instancia_item (id_instancia_criatura, id_instancia_item) FROM stdin;
    public          postgres    false    227   6      ;          0    16470    instancia_item 
   TABLE DATA           5   COPY public.instancia_item (id, id_item) FROM stdin;
    public          postgres    false    228   96      T          0    18414    instancia_item_posicao 
   TABLE DATA           S   COPY public.instancia_item_posicao (id_instancia_item, id_localizacao) FROM stdin;
    public          postgres    false    253   z6      >          0    16475 
   inventario 
   TABLE DATA           �   COPY public.inventario (look_corpo, look_cabeca, look_pernas, look_pes, look_costas, mao_dir, mao_esq, fonte_de_luz, capacidade, id_player, riqueza) FROM stdin;
    public          postgres    false    231   �6      ?          0    16479     inventario_guarda_instancia_item 
   TABLE DATA           X   COPY public.inventario_guarda_instancia_item (id_instancia_item, id_player) FROM stdin;
    public          postgres    false    232   �6      @          0    16482    item 
   TABLE DATA           (   COPY public.item (id, tipo) FROM stdin;
    public          postgres    false    233   7      B          0    16489    localizacao 
   TABLE DATA           U   COPY public.localizacao (id, posicao_x, posicao_y, posicao_z, id_regiao) FROM stdin;
    public          postgres    false    235   �7      D          0    16498    mapa 
   TABLE DATA           (   COPY public.mapa (id, nome) FROM stdin;
    public          postgres    false    237   u9      F          0    16502    mochila 
   TABLE DATA           Z   COPY public.mochila (id, nome, capacidade, min_level, descricao, peso, preco) FROM stdin;
    public          postgres    false    239   �9      G          0    16507    npc 
   TABLE DATA           =   COPY public.npc (id, nome, tipo, id_localizacao) FROM stdin;
    public          postgres    false    240   8:      H          0    16512    npc_carrega_instancia_item 
   TABLE DATA           O   COPY public.npc_carrega_instancia_item (id_npc, id_instancia_item) FROM stdin;
    public          postgres    false    241   �:      J          0    16516 
   personagem 
   TABLE DATA           .   COPY public.personagem (id, tipo) FROM stdin;
    public          postgres    false    243   �:      L          0    16522    player 
   TABLE DATA           �   COPY public.player (nome, vocacao, vida_maxima, vida_atual, mana_maxima, mana_atual, genero, experiencia, level, id, data_de_criacao, id_conta, id_localizacao) FROM stdin;
    public          postgres    false    245   D;      R          0    16848    players_guilda 
   TABLE DATA           >   COPY public.players_guilda (id_guilda, id_player) FROM stdin;
    public          postgres    false    251   )<      N          0    16535    regiao 
   TABLE DATA           >   COPY public.regiao (id, vip_check, id_mapa, nome) FROM stdin;
    public          postgres    false    247   F<      P          0    16540    riqueza 
   TABLE DATA           N   COPY public.riqueza (id, nome, valor, min_level, descricao, peso) FROM stdin;
    public          postgres    false    249   �<      Q          0    16545    vende 
   TABLE DATA           E   COPY public.vende (id_npc, id_instancia_item, id_player) FROM stdin;
    public          postgres    false    250   =      e           0    0    batalha_id_batalha_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.batalha_id_batalha_seq', 1, false);
          public          postgres    false    212            f           0    0    conta_id_conta_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.conta_id_conta_seq', 7, true);
          public          postgres    false    218            g           0    0    criatura_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.criatura_id_seq', 15, true);
          public          postgres    false    220            h           0    0    guilda_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.guilda_id_seq', 1, false);
          public          postgres    false    223            i           0    0    habilidades_id_player_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.habilidades_id_player_seq', 1, false);
          public          postgres    false    252            j           0    0    instancia_criatura_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.instancia_criatura_id_seq', 1, false);
          public          postgres    false    229            k           0    0    instancia_item_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.instancia_item_id_seq', 13, true);
          public          postgres    false    230            l           0    0    item_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.item_id_seq', 42, true);
          public          postgres    false    234            m           0    0    localizacao_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.localizacao_id_seq', 125, true);
          public          postgres    false    236            n           0    0    mapa_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.mapa_id_seq', 1, true);
          public          postgres    false    238            o           0    0 
   npc_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.npc_id_seq', 5, true);
          public          postgres    false    242            p           0    0    personagem_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.personagem_id_seq', 26, true);
          public          postgres    false    244            q           0    0    player_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.player_id_seq', 6, true);
          public          postgres    false    246            r           0    0    regiao_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.regiao_id_seq', 1, false);
          public          postgres    false    248                       2606    17452    armas armas_nome_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.armas
    ADD CONSTRAINT armas_nome_key UNIQUE (nome);
 >   ALTER TABLE ONLY public.armas DROP CONSTRAINT armas_nome_key;
       public            postgres    false    210            !           2606    16564    armas armas_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.armas
    ADD CONSTRAINT armas_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.armas DROP CONSTRAINT armas_pkey;
       public            postgres    false    210            #           2606    16566    batalha batalha_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.batalha
    ADD CONSTRAINT batalha_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.batalha DROP CONSTRAINT batalha_pkey;
       public            postgres    false    211            %           2606    16568 "   batalha_pvc_cm batalha_pvc_cm_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.batalha_pvc_cm
    ADD CONSTRAINT batalha_pvc_cm_pkey PRIMARY KEY (id_batalha);
 L   ALTER TABLE ONLY public.batalha_pvc_cm DROP CONSTRAINT batalha_pvc_cm_pkey;
       public            postgres    false    213            '           2606    16570 "   batalha_pvc_sm batalha_pvc_sm_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.batalha_pvc_sm
    ADD CONSTRAINT batalha_pvc_sm_pkey PRIMARY KEY (id_batalha);
 L   ALTER TABLE ONLY public.batalha_pvc_sm DROP CONSTRAINT batalha_pvc_sm_pkey;
       public            postgres    false    214            )           2606    16572 "   batalha_pvp_cm batalha_pvp_cm_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.batalha_pvp_cm
    ADD CONSTRAINT batalha_pvp_cm_pkey PRIMARY KEY (id_batalha);
 L   ALTER TABLE ONLY public.batalha_pvp_cm DROP CONSTRAINT batalha_pvp_cm_pkey;
       public            postgres    false    215            +           2606    16574 "   batalha_pvp_sm batalha_pvp_sm_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.batalha_pvp_sm
    ADD CONSTRAINT batalha_pvp_sm_pkey PRIMARY KEY (id_batalha);
 L   ALTER TABLE ONLY public.batalha_pvp_sm DROP CONSTRAINT batalha_pvp_sm_pkey;
       public            postgres    false    216            -           2606    17582    conta conta_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.conta
    ADD CONSTRAINT conta_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.conta DROP CONSTRAINT conta_email_key;
       public            postgres    false    217            /           2606    16578    conta conta_id_key 
   CONSTRAINT     K   ALTER TABLE ONLY public.conta
    ADD CONSTRAINT conta_id_key UNIQUE (id);
 <   ALTER TABLE ONLY public.conta DROP CONSTRAINT conta_id_key;
       public            postgres    false    217            1           2606    16580    conta conta_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.conta
    ADD CONSTRAINT conta_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.conta DROP CONSTRAINT conta_pkey;
       public            postgres    false    217            3           2606    17469    criatura criatura_nome_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.criatura
    ADD CONSTRAINT criatura_nome_key UNIQUE (nome);
 D   ALTER TABLE ONLY public.criatura DROP CONSTRAINT criatura_nome_key;
       public            postgres    false    219            5           2606    16584    criatura criatura_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.criatura
    ADD CONSTRAINT criatura_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.criatura DROP CONSTRAINT criatura_pkey;
       public            postgres    false    219            7           2606    17478     equipamento equipamento_nome_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.equipamento
    ADD CONSTRAINT equipamento_nome_key UNIQUE (nome);
 J   ALTER TABLE ONLY public.equipamento DROP CONSTRAINT equipamento_nome_key;
       public            postgres    false    221            9           2606    16588    equipamento equipamento_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.equipamento
    ADD CONSTRAINT equipamento_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.equipamento DROP CONSTRAINT equipamento_pkey;
       public            postgres    false    221            ;           2606    17494    guilda guilda_nome_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.guilda
    ADD CONSTRAINT guilda_nome_key UNIQUE (nome);
 @   ALTER TABLE ONLY public.guilda DROP CONSTRAINT guilda_nome_key;
       public            postgres    false    222            =           2606    16592    guilda guilda_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.guilda
    ADD CONSTRAINT guilda_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.guilda DROP CONSTRAINT guilda_pkey;
       public            postgres    false    222            ?           2606    17600    habilidades habilidades_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.habilidades
    ADD CONSTRAINT habilidades_pkey PRIMARY KEY (id_player);
 F   ALTER TABLE ONLY public.habilidades DROP CONSTRAINT habilidades_pkey;
       public            postgres    false    224            A           2606    16596    historico historico_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.historico
    ADD CONSTRAINT historico_pkey PRIMARY KEY (id_player_morto);
 B   ALTER TABLE ONLY public.historico DROP CONSTRAINT historico_pkey;
       public            postgres    false    225            E           2606    16598 X   instancia_criatura_carrega_instancia_item instancia_criatura_carrega_instancia_item_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.instancia_criatura_carrega_instancia_item
    ADD CONSTRAINT instancia_criatura_carrega_instancia_item_pkey PRIMARY KEY (id_instancia_criatura);
 �   ALTER TABLE ONLY public.instancia_criatura_carrega_instancia_item DROP CONSTRAINT instancia_criatura_carrega_instancia_item_pkey;
       public            postgres    false    227            C           2606    16600 *   instancia_criatura instancia_criatura_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.instancia_criatura
    ADD CONSTRAINT instancia_criatura_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.instancia_criatura DROP CONSTRAINT instancia_criatura_pkey;
       public            postgres    false    226            o           2606    18418 2   instancia_item_posicao instancia_item_posicao_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.instancia_item_posicao
    ADD CONSTRAINT instancia_item_posicao_pkey PRIMARY KEY (id_instancia_item, id_localizacao);
 \   ALTER TABLE ONLY public.instancia_item_posicao DROP CONSTRAINT instancia_item_posicao_pkey;
       public            postgres    false    253    253            G           2606    16602 !   instancia_item instanciaitem_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.instancia_item
    ADD CONSTRAINT instanciaitem_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY public.instancia_item DROP CONSTRAINT instanciaitem_pkey;
       public            postgres    false    228            K           2606    16913 F   inventario_guarda_instancia_item inventario_guarda_instancia_item_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventario_guarda_instancia_item
    ADD CONSTRAINT inventario_guarda_instancia_item_pkey PRIMARY KEY (id_player, id_instancia_item);
 p   ALTER TABLE ONLY public.inventario_guarda_instancia_item DROP CONSTRAINT inventario_guarda_instancia_item_pkey;
       public            postgres    false    232    232            I           2606    16606    inventario inventario_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_pkey PRIMARY KEY (id_player);
 D   ALTER TABLE ONLY public.inventario DROP CONSTRAINT inventario_pkey;
       public            postgres    false    231            M           2606    16608    item item_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.item DROP CONSTRAINT item_pkey;
       public            postgres    false    233            O           2606    16610    localizacao localizacao_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.localizacao
    ADD CONSTRAINT localizacao_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.localizacao DROP CONSTRAINT localizacao_pkey;
       public            postgres    false    235            Q           2606    16612    mapa mapa_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.mapa DROP CONSTRAINT mapa_pkey;
       public            postgres    false    237            S           2606    17534    mochila mochila_nome_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.mochila
    ADD CONSTRAINT mochila_nome_key UNIQUE (nome);
 B   ALTER TABLE ONLY public.mochila DROP CONSTRAINT mochila_nome_key;
       public            postgres    false    239            U           2606    16616    mochila mochila_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.mochila
    ADD CONSTRAINT mochila_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.mochila DROP CONSTRAINT mochila_pkey;
       public            postgres    false    239            [           2606    16618 :   npc_carrega_instancia_item npc_carrega_instancia_item_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.npc_carrega_instancia_item
    ADD CONSTRAINT npc_carrega_instancia_item_pkey PRIMARY KEY (id_npc, id_instancia_item);
 d   ALTER TABLE ONLY public.npc_carrega_instancia_item DROP CONSTRAINT npc_carrega_instancia_item_pkey;
       public            postgres    false    241    241            W           2606    17551    npc npc_nome_key 
   CONSTRAINT     K   ALTER TABLE ONLY public.npc
    ADD CONSTRAINT npc_nome_key UNIQUE (nome);
 :   ALTER TABLE ONLY public.npc DROP CONSTRAINT npc_nome_key;
       public            postgres    false    240            Y           2606    16622    npc npc_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.npc
    ADD CONSTRAINT npc_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.npc DROP CONSTRAINT npc_pkey;
       public            postgres    false    240            ]           2606    16624    personagem personagem_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.personagem
    ADD CONSTRAINT personagem_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.personagem DROP CONSTRAINT personagem_pkey;
       public            postgres    false    243            _           2606    16626    player player_id_key 
   CONSTRAINT     M   ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_id_key UNIQUE (id);
 >   ALTER TABLE ONLY public.player DROP CONSTRAINT player_id_key;
       public            postgres    false    245            a           2606    17405    player player_nome_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_nome_key UNIQUE (nome);
 @   ALTER TABLE ONLY public.player DROP CONSTRAINT player_nome_key;
       public            postgres    false    245            c           2606    16630    player player_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.player DROP CONSTRAINT player_pkey;
       public            postgres    false    245            m           2606    16852 "   players_guilda players_guilda_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.players_guilda
    ADD CONSTRAINT players_guilda_pkey PRIMARY KEY (id_guilda);
 L   ALTER TABLE ONLY public.players_guilda DROP CONSTRAINT players_guilda_pkey;
       public            postgres    false    251            e           2606    16632    regiao regiao_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.regiao
    ADD CONSTRAINT regiao_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.regiao DROP CONSTRAINT regiao_pkey;
       public            postgres    false    247            g           2606    17564    riqueza riqueza_nome_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.riqueza
    ADD CONSTRAINT riqueza_nome_key UNIQUE (nome);
 B   ALTER TABLE ONLY public.riqueza DROP CONSTRAINT riqueza_nome_key;
       public            postgres    false    249            i           2606    16636    riqueza riqueza_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.riqueza
    ADD CONSTRAINT riqueza_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.riqueza DROP CONSTRAINT riqueza_pkey;
       public            postgres    false    249            k           2606    16638    vende vende_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.vende
    ADD CONSTRAINT vende_pkey PRIMARY KEY (id_instancia_item);
 :   ALTER TABLE ONLY public.vende DROP CONSTRAINT vende_pkey;
       public            postgres    false    250            �           2620    18436 <   npc_carrega_instancia_item trigger_verificar_id_npc_vendedor    TRIGGER     �   CREATE TRIGGER trigger_verificar_id_npc_vendedor BEFORE INSERT OR UPDATE ON public.npc_carrega_instancia_item FOR EACH ROW EXECUTE FUNCTION public.verificar_id_npc_vendedor();
 U   DROP TRIGGER trigger_verificar_id_npc_vendedor ON public.npc_carrega_instancia_item;
       public          postgres    false    241    271            �           2620    18435 '   vende trigger_verificar_id_npc_vendedor    TRIGGER     �   CREATE TRIGGER trigger_verificar_id_npc_vendedor BEFORE INSERT OR UPDATE ON public.vende FOR EACH ROW EXECUTE FUNCTION public.verificar_id_npc_vendedor();
 @   DROP TRIGGER trigger_verificar_id_npc_vendedor ON public.vende;
       public          postgres    false    271    250            �           2620    16922 D   inventario_guarda_instancia_item trigger_verificar_limite_inventario    TRIGGER     �   CREATE TRIGGER trigger_verificar_limite_inventario BEFORE INSERT ON public.inventario_guarda_instancia_item FOR EACH ROW EXECUTE FUNCTION public.verificar_limite_inventario();
 ]   DROP TRIGGER trigger_verificar_limite_inventario ON public.inventario_guarda_instancia_item;
       public          postgres    false    277    232            p           2606    16639    armas armas_id_fkey    FK CONSTRAINT     l   ALTER TABLE ONLY public.armas
    ADD CONSTRAINT armas_id_fkey FOREIGN KEY (id) REFERENCES public.item(id);
 =   ALTER TABLE ONLY public.armas DROP CONSTRAINT armas_id_fkey;
       public          postgres    false    233    210    3405            q           2606    16644 -   batalha_pvc_cm batalha_pvc_cm_id_batalha_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.batalha_pvc_cm
    ADD CONSTRAINT batalha_pvc_cm_id_batalha_fkey FOREIGN KEY (id_batalha) REFERENCES public.batalha(id);
 W   ALTER TABLE ONLY public.batalha_pvc_cm DROP CONSTRAINT batalha_pvc_cm_id_batalha_fkey;
       public          postgres    false    3363    213    211            r           2606    16649 8   batalha_pvc_cm batalha_pvc_cm_id_instancia_criatura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.batalha_pvc_cm
    ADD CONSTRAINT batalha_pvc_cm_id_instancia_criatura_fkey FOREIGN KEY (id_instancia_criatura) REFERENCES public.instancia_criatura(id);
 b   ALTER TABLE ONLY public.batalha_pvc_cm DROP CONSTRAINT batalha_pvc_cm_id_instancia_criatura_fkey;
       public          postgres    false    3395    213    226            s           2606    16654 2   batalha_pvc_cm batalha_pvc_cm_id_player_morto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.batalha_pvc_cm
    ADD CONSTRAINT batalha_pvc_cm_id_player_morto_fkey FOREIGN KEY (id_player_morto) REFERENCES public.player(id);
 \   ALTER TABLE ONLY public.batalha_pvc_cm DROP CONSTRAINT batalha_pvc_cm_id_player_morto_fkey;
       public          postgres    false    3423    213    245            t           2606    16659 -   batalha_pvc_sm batalha_pvc_sm_id_batalha_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.batalha_pvc_sm
    ADD CONSTRAINT batalha_pvc_sm_id_batalha_fkey FOREIGN KEY (id_batalha) REFERENCES public.batalha(id);
 W   ALTER TABLE ONLY public.batalha_pvc_sm DROP CONSTRAINT batalha_pvc_sm_id_batalha_fkey;
       public          postgres    false    3363    214    211            u           2606    16664 8   batalha_pvc_sm batalha_pvc_sm_id_instancia_criatura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.batalha_pvc_sm
    ADD CONSTRAINT batalha_pvc_sm_id_instancia_criatura_fkey FOREIGN KEY (id_instancia_criatura) REFERENCES public.instancia_criatura(id);
 b   ALTER TABLE ONLY public.batalha_pvc_sm DROP CONSTRAINT batalha_pvc_sm_id_instancia_criatura_fkey;
       public          postgres    false    226    3395    214            v           2606    16669 ,   batalha_pvc_sm batalha_pvc_sm_id_player_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.batalha_pvc_sm
    ADD CONSTRAINT batalha_pvc_sm_id_player_fkey FOREIGN KEY (id_player) REFERENCES public.player(id);
 V   ALTER TABLE ONLY public.batalha_pvc_sm DROP CONSTRAINT batalha_pvc_sm_id_player_fkey;
       public          postgres    false    214    3423    245            w           2606    16674 -   batalha_pvp_cm batalha_pvp_cm_id_batalha_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.batalha_pvp_cm
    ADD CONSTRAINT batalha_pvp_cm_id_batalha_fkey FOREIGN KEY (id_batalha) REFERENCES public.batalha(id);
 W   ALTER TABLE ONLY public.batalha_pvp_cm DROP CONSTRAINT batalha_pvp_cm_id_batalha_fkey;
       public          postgres    false    211    215    3363            x           2606    16679 2   batalha_pvp_cm batalha_pvp_cm_id_player_morto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.batalha_pvp_cm
    ADD CONSTRAINT batalha_pvp_cm_id_player_morto_fkey FOREIGN KEY (id_player_morto) REFERENCES public.player(id);
 \   ALTER TABLE ONLY public.batalha_pvp_cm DROP CONSTRAINT batalha_pvp_cm_id_player_morto_fkey;
       public          postgres    false    3423    215    245            y           2606    16684 1   batalha_pvp_cm batalha_pvp_cm_id_player_vivo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.batalha_pvp_cm
    ADD CONSTRAINT batalha_pvp_cm_id_player_vivo_fkey FOREIGN KEY (id_player_vivo) REFERENCES public.player(id);
 [   ALTER TABLE ONLY public.batalha_pvp_cm DROP CONSTRAINT batalha_pvp_cm_id_player_vivo_fkey;
       public          postgres    false    215    3423    245            z           2606    16689 -   batalha_pvp_sm batalha_pvp_sm_id_batalha_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.batalha_pvp_sm
    ADD CONSTRAINT batalha_pvp_sm_id_batalha_fkey FOREIGN KEY (id_batalha) REFERENCES public.batalha(id);
 W   ALTER TABLE ONLY public.batalha_pvp_sm DROP CONSTRAINT batalha_pvp_sm_id_batalha_fkey;
       public          postgres    false    216    3363    211            |           2606    16699 1   batalha_pvp_sm batalha_pvp_sm_id_player_dois_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.batalha_pvp_sm
    ADD CONSTRAINT batalha_pvp_sm_id_player_dois_fkey FOREIGN KEY (id_player_dois) REFERENCES public.player(id);
 [   ALTER TABLE ONLY public.batalha_pvp_sm DROP CONSTRAINT batalha_pvp_sm_id_player_dois_fkey;
       public          postgres    false    3423    245    216            {           2606    16694 /   batalha_pvp_sm batalha_pvp_sm_id_player_um_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.batalha_pvp_sm
    ADD CONSTRAINT batalha_pvp_sm_id_player_um_fkey FOREIGN KEY (id_player_um) REFERENCES public.player(id);
 Y   ALTER TABLE ONLY public.batalha_pvp_sm DROP CONSTRAINT batalha_pvp_sm_id_player_um_fkey;
       public          postgres    false    245    216    3423            ~           2606    17399 %   criatura criatura_id_localizacao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.criatura
    ADD CONSTRAINT criatura_id_localizacao_fkey FOREIGN KEY (id_localizacao) REFERENCES public.localizacao(id) NOT VALID;
 O   ALTER TABLE ONLY public.criatura DROP CONSTRAINT criatura_id_localizacao_fkey;
       public          postgres    false    219    235    3407            }           2606    17394 $   criatura criatura_id_personagem_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.criatura
    ADD CONSTRAINT criatura_id_personagem_fkey FOREIGN KEY (id) REFERENCES public.personagem(id) NOT VALID;
 N   ALTER TABLE ONLY public.criatura DROP CONSTRAINT criatura_id_personagem_fkey;
       public          postgres    false    243    219    3421                       2606    16709    equipamento equipamento_id_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public.equipamento
    ADD CONSTRAINT equipamento_id_fkey FOREIGN KEY (id) REFERENCES public.item(id);
 I   ALTER TABLE ONLY public.equipamento DROP CONSTRAINT equipamento_id_fkey;
       public          postgres    false    233    221    3405            �           2606    17589    guilda guilda_id_dono_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.guilda
    ADD CONSTRAINT guilda_id_dono_fkey FOREIGN KEY (id_dono) REFERENCES public.player(id) NOT VALID;
 D   ALTER TABLE ONLY public.guilda DROP CONSTRAINT guilda_id_dono_fkey;
       public          postgres    false    245    3423    222            �           2606    17601    habilidades habilidades_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.habilidades
    ADD CONSTRAINT habilidades_id_fkey FOREIGN KEY (id_player) REFERENCES public.player(id) NOT VALID;
 I   ALTER TABLE ONLY public.habilidades DROP CONSTRAINT habilidades_id_fkey;
       public          postgres    false    224    245    3423            �           2606    16724 (   historico historico_id_player_morto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.historico
    ADD CONSTRAINT historico_id_player_morto_fkey FOREIGN KEY (id_player_morto) REFERENCES public.player(id);
 R   ALTER TABLE ONLY public.historico DROP CONSTRAINT historico_id_player_morto_fkey;
       public          postgres    false    245    225    3423            �           2606    16729 i   instancia_criatura_carrega_instancia_item instancia_criatura_carrega_instancia_i_id_instancia_criatura_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.instancia_criatura_carrega_instancia_item
    ADD CONSTRAINT instancia_criatura_carrega_instancia_i_id_instancia_criatura_fk FOREIGN KEY (id_instancia_criatura) REFERENCES public.instancia_criatura(id);
 �   ALTER TABLE ONLY public.instancia_criatura_carrega_instancia_item DROP CONSTRAINT instancia_criatura_carrega_instancia_i_id_instancia_criatura_fk;
       public          postgres    false    227    226    3395            �           2606    16734 i   instancia_criatura_carrega_instancia_item instancia_criatura_carrega_instancia_item_id_instancia_item_fke    FK CONSTRAINT     �   ALTER TABLE ONLY public.instancia_criatura_carrega_instancia_item
    ADD CONSTRAINT instancia_criatura_carrega_instancia_item_id_instancia_item_fke FOREIGN KEY (id_instancia_item) REFERENCES public.instancia_item(id);
 �   ALTER TABLE ONLY public.instancia_criatura_carrega_instancia_item DROP CONSTRAINT instancia_criatura_carrega_instancia_item_id_instancia_item_fke;
       public          postgres    false    227    228    3399            �           2606    16739 6   instancia_criatura instancia_criatura_id_criatura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.instancia_criatura
    ADD CONSTRAINT instancia_criatura_id_criatura_fkey FOREIGN KEY (id_criatura) REFERENCES public.criatura(id);
 `   ALTER TABLE ONLY public.instancia_criatura DROP CONSTRAINT instancia_criatura_id_criatura_fkey;
       public          postgres    false    219    226    3381            �           2606    16744 *   instancia_item instancia_item_id_item_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.instancia_item
    ADD CONSTRAINT instancia_item_id_item_fkey FOREIGN KEY (id_item) REFERENCES public.item(id);
 T   ALTER TABLE ONLY public.instancia_item DROP CONSTRAINT instancia_item_id_item_fkey;
       public          postgres    false    228    3405    233            �           2606    18419 D   instancia_item_posicao instancia_item_posicao_id_instancia_item_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.instancia_item_posicao
    ADD CONSTRAINT instancia_item_posicao_id_instancia_item_fkey FOREIGN KEY (id_instancia_item) REFERENCES public.instancia_item(id);
 n   ALTER TABLE ONLY public.instancia_item_posicao DROP CONSTRAINT instancia_item_posicao_id_instancia_item_fkey;
       public          postgres    false    3399    228    253            �           2606    18424 A   instancia_item_posicao instancia_item_posicao_id_localizacao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.instancia_item_posicao
    ADD CONSTRAINT instancia_item_posicao_id_localizacao_fkey FOREIGN KEY (id_localizacao) REFERENCES public.localizacao(id);
 k   ALTER TABLE ONLY public.instancia_item_posicao DROP CONSTRAINT instancia_item_posicao_id_localizacao_fkey;
       public          postgres    false    253    235    3407            �           2606    16759 X   inventario_guarda_instancia_item inventario_guarda_instancia_item_id_instancia_item_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario_guarda_instancia_item
    ADD CONSTRAINT inventario_guarda_instancia_item_id_instancia_item_fkey FOREIGN KEY (id_instancia_item) REFERENCES public.instancia_item(id);
 �   ALTER TABLE ONLY public.inventario_guarda_instancia_item DROP CONSTRAINT inventario_guarda_instancia_item_id_instancia_item_fkey;
       public          postgres    false    3399    228    232            �           2606    16902 P   inventario_guarda_instancia_item inventario_guarda_instancia_item_id_player_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario_guarda_instancia_item
    ADD CONSTRAINT inventario_guarda_instancia_item_id_player_fkey FOREIGN KEY (id_player) REFERENCES public.player(id);
 z   ALTER TABLE ONLY public.inventario_guarda_instancia_item DROP CONSTRAINT inventario_guarda_instancia_item_id_player_fkey;
       public          postgres    false    232    3423    245            �           2606    16907 $   inventario inventario_id_player_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_id_player_fkey FOREIGN KEY (id_player) REFERENCES public.player(id);
 N   ALTER TABLE ONLY public.inventario DROP CONSTRAINT inventario_id_player_fkey;
       public          postgres    false    245    231    3423            �           2606    16764 &   localizacao localizacao_id_regiao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.localizacao
    ADD CONSTRAINT localizacao_id_regiao_fkey FOREIGN KEY (id_regiao) REFERENCES public.regiao(id);
 P   ALTER TABLE ONLY public.localizacao DROP CONSTRAINT localizacao_id_regiao_fkey;
       public          postgres    false    235    247    3429            �           2606    16769    mochila mochila_id_fkey    FK CONSTRAINT     p   ALTER TABLE ONLY public.mochila
    ADD CONSTRAINT mochila_id_fkey FOREIGN KEY (id) REFERENCES public.item(id);
 A   ALTER TABLE ONLY public.mochila DROP CONSTRAINT mochila_id_fkey;
       public          postgres    false    3405    239    233            �           2606    16774 L   npc_carrega_instancia_item npc_carrega_instancia_item_id_instancia_item_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.npc_carrega_instancia_item
    ADD CONSTRAINT npc_carrega_instancia_item_id_instancia_item_fkey FOREIGN KEY (id_instancia_item) REFERENCES public.instancia_item(id);
 v   ALTER TABLE ONLY public.npc_carrega_instancia_item DROP CONSTRAINT npc_carrega_instancia_item_id_instancia_item_fkey;
       public          postgres    false    241    3399    228            �           2606    16779 A   npc_carrega_instancia_item npc_carrega_instancia_item_id_npc_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.npc_carrega_instancia_item
    ADD CONSTRAINT npc_carrega_instancia_item_id_npc_fkey FOREIGN KEY (id_npc) REFERENCES public.npc(id);
 k   ALTER TABLE ONLY public.npc_carrega_instancia_item DROP CONSTRAINT npc_carrega_instancia_item_id_npc_fkey;
       public          postgres    false    241    3417    240            �           2606    16961    npc npc_id_localizacao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.npc
    ADD CONSTRAINT npc_id_localizacao_fkey FOREIGN KEY (id_localizacao) REFERENCES public.localizacao(id) NOT VALID;
 E   ALTER TABLE ONLY public.npc DROP CONSTRAINT npc_id_localizacao_fkey;
       public          postgres    false    240    235    3407            �           2606    16956    npc npc_id_personagem_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.npc
    ADD CONSTRAINT npc_id_personagem_fkey FOREIGN KEY (id) REFERENCES public.personagem(id) NOT VALID;
 D   ALTER TABLE ONLY public.npc DROP CONSTRAINT npc_id_personagem_fkey;
       public          postgres    false    240    243    3421            �           2606    16794    player player_id_conta_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_id_conta_fkey FOREIGN KEY (id_conta) REFERENCES public.conta(id);
 E   ALTER TABLE ONLY public.player DROP CONSTRAINT player_id_conta_fkey;
       public          postgres    false    3375    217    245            �           2606    16946 !   player player_id_localizacao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_id_localizacao_fkey FOREIGN KEY (id_localizacao) REFERENCES public.localizacao(id) NOT VALID;
 K   ALTER TABLE ONLY public.player DROP CONSTRAINT player_id_localizacao_fkey;
       public          postgres    false    3407    235    245            �           2606    16941     player player_id_personagem_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_id_personagem_fkey FOREIGN KEY (id) REFERENCES public.personagem(id) NOT VALID;
 J   ALTER TABLE ONLY public.player DROP CONSTRAINT player_id_personagem_fkey;
       public          postgres    false    245    3421    243            �           2606    16853 ,   players_guilda players_guilda_id_guilda_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.players_guilda
    ADD CONSTRAINT players_guilda_id_guilda_fkey FOREIGN KEY (id_guilda) REFERENCES public.guilda(id);
 V   ALTER TABLE ONLY public.players_guilda DROP CONSTRAINT players_guilda_id_guilda_fkey;
       public          postgres    false    3389    222    251            �           2606    16858 ,   players_guilda players_guilda_id_player_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.players_guilda
    ADD CONSTRAINT players_guilda_id_player_fkey FOREIGN KEY (id_player) REFERENCES public.player(id);
 V   ALTER TABLE ONLY public.players_guilda DROP CONSTRAINT players_guilda_id_player_fkey;
       public          postgres    false    251    3423    245            �           2606    16804    regiao regiao_id_mapa_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public.regiao
    ADD CONSTRAINT regiao_id_mapa_fkey FOREIGN KEY (id_mapa) REFERENCES public.mapa(id);
 D   ALTER TABLE ONLY public.regiao DROP CONSTRAINT regiao_id_mapa_fkey;
       public          postgres    false    3409    237    247            �           2606    16809    riqueza riqueza_id_fkey    FK CONSTRAINT     p   ALTER TABLE ONLY public.riqueza
    ADD CONSTRAINT riqueza_id_fkey FOREIGN KEY (id) REFERENCES public.item(id);
 A   ALTER TABLE ONLY public.riqueza DROP CONSTRAINT riqueza_id_fkey;
       public          postgres    false    3405    233    249            �           2606    16936    vende vende_id_player_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.vende
    ADD CONSTRAINT vende_id_player_fkey FOREIGN KEY (id_player) REFERENCES public.player(id);
 D   ALTER TABLE ONLY public.vende DROP CONSTRAINT vende_id_player_fkey;
       public          postgres    false    3423    245    250            �           2606    16814    vende vende_idnpc_fkey    FK CONSTRAINT     r   ALTER TABLE ONLY public.vende
    ADD CONSTRAINT vende_idnpc_fkey FOREIGN KEY (id_npc) REFERENCES public.npc(id);
 @   ALTER TABLE ONLY public.vende DROP CONSTRAINT vende_idnpc_fkey;
       public          postgres    false    3417    240    250            )   �  x���Mn�0���>��L�*�*U�"u������?�����j�АTk�O3�q�;Q�C!�}I���N�Ai%��Yo�?�HS�ɇT�&�̐<I�IBC$��`��.s9td�K^2� �B�ȁVB�c8��<s4A3�M1����SW�?;�ϻ���ԊS'ړQ����r������mW�SW)�B^DMT��;:�~�y&m�M��J�܌j,K������A�Bpv"c����|9�����̌Ƹ���OD��?5W��f��8��j���9Y�I/q6@�d�[G�bYj]�M��J��������9��]Յڍ@��*�E]{��fXDY�޻��-t��DގF=qg��Z;Ox��,�����R�z�|��B�U�$�$��M�/�Ţ�      *      x������ � �      ,      x������ � �      -      x������ � �      .      x������ � �      /      x������ � �      0   F  x���M�� ��z
/��g4ɬ�f1t~��n$M�bb�Is�9�\lLZJ�i���7>�<�q]e"3�t{_7�:V�	���yA�?h�c�a�&��E�P�SЄ��\"Q�i*
�jb�9�z����ݖ|�߼��H�]��f�w_f�T�Ze��<`d�c��劂XF	��ǚ�mw�g�P0M����M>z��/F�#I�"F�#�Z
�i��yg��㪤.AM��PՉ%�gv�X=ARhc��kNUnL��5,�NB���I�t�G�=wۙ��ONz'��	�Fê����X�T��rr"cuB����%�Kh��x�0ƿ�Y�      2   =  x����J�0���b�@f��I���EaB�6u�F���NV���N������	اe�{��L���<�R>�M�>����`]�����9ki��]��F�S�8���)���R��ׯ��3�R�]_��v��$B t+��x�YY�]���Z#���<�夁I�߶am�78�I�j�^�y��ʆ��xߕj���GC�=���E���L,$�n�|��ƈ����")��2�*y2�x�˨j\+�ZOh�z��X��r�M�~�h�Z:�V���S����4�S�e����[3��n9*M�������vg�����      4     x���͎�0���)���8�Tj�j�T=T{����:62�U�6��5��:̒hE�������|d����d�8���T��O�_U����}��~rY*v��G�(��̃
<�!����*�`+��˖}�P���4�©G��԰1�(K�n�mvH���%��\��l_��B��^�2ml�����)E(]��v�L�p���xc�r�M�d���I�Xp�A4V�7��8TR�G�-�ߝ���i�4c�kil܌�J�^��n�zm�X�ڌט�QdF>�\��d;�K�7_Ҭ�X6�٠_�����:�s�6�N��U��a�����[�/i�X}�~��T}�F4զe��v��[S�i������@o�}{���N8��K�d�vuf`NM�o��v{�jD�ڪQ�n`w�J����a�xl��	ѪP���7{��H/־@1��9z.m����)�4}��賹R��o�U����Q�y��2x�؞�v6^�K/��#oQ�l�Q[|��Ԓ}g� ��B��I9��7��3�Xм<1](,��Z��B�X���O�j��ic{�      5      x������ � �      7      x������ � �      8      x������ � �      9      x������ � �      :      x������ � �      ;   1   x���  �7)�1�ً��a�K#\B�LY�͉�݌�f�u��5 !�      T      x������ � �      >   P   x�e��	�0D���bdg16a�#(l�c��qb����u~�Q�Ê|�^ؑ+���9]?������B����&"1�%�      ?      x�3�4����� r!      @   �   x�]��
� ���a�1i�ﲋa�\�n���w1��|H������+�Q_���g%qm���#���nG�f��˹ϥ��gꓽ1P�ʶ�m/��i`�'�UQ'�uA��	��Q��X%X%X%X%X%X%X�X�X�a|��BD?1�	      B   �  x�E�Kr�0���a:�ϲ�����$>�L�$}�I�ޫ��}��eas�;�.�~�^��t�G��s���Ǿs�cع�A�}Yڒ}[�����Nϵ�a�\r������}�y]����z"�պd�׶d���t·�9b�ju�R�S��٪Z��X`���s�-���g0��`��`ȫ��/���.�i�1<b0��`��`ȫ��/�6�.1X���`�G\`�*/X}�
�=Q��!Y��!*Vap�daH���fS��Y��!Y��`��nS��*�º�Q��`�08
�00C�0$CTX�O��Y��!Y��`gaH�da�
���(156E��\"3���Y���4�����9s���27���M���8�L�-�s���T�?l.ٝ[���)=�7��gf����!      D      x�3�t�J-�/�P��=... E��      F   �   x�3�tJLW ppp��'^U��Z\rx�BYj^J��,=����|=N�?.CKN����R��c�,4k�8��sRR�H��5���1�Wrv�^Ƹ�b�C�5�{���F�mx�A1ö=... ��z�      G   k   x�32�J,��LQ p&��%g&敤rss���'�b�F\F&�!E�e�E���b�)�%����řE��$�43���3N�⌒��|��640����� w�=�      H      x������ � �      J   d   x�M�;
�0E�:���@��G݋M)��p�b�ޭNw����mx/0�	����8���"+��:��l�@��D�d�*m��F_����z�b�ɉ��}�ϬW�      L   �   x����
�  �s|
_�#Z��+;�� ����k��{�ٿ��
Ss1�O���L�����e_@ ��S<�]m���)����#�9�aX�>!ة��Ho�+c�-��� 4�1qF��P�J5�}��uՖ�
@��&11��_ǼL�K��ٚ����m��a��!����5�зw���9Ҕ�d�q�x6���`�$!$!5��c���      R      x������ � �      N   k   x�3�L�4�K��/JU�	���ʼ�K�R�\R�S�J0�������$�+8'�`7��, '13�X!?M�#�,?S�)g	P�[jeQfq��o~i^	X��=... ->)�      P   C   x�3�t��IQp���S prp��'^U��Z\rx�BYj^J��$=����|C=N=C�=... �*      Q      x�32�4�4����� M�     